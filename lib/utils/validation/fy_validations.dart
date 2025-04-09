import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../extensions/string_extensions/string_extensions.dart';
import 'cnpj_validator.dart';
import 'cpf_validator.dart';

typedef ValidatorsCallBack = List<ValueGetter<String?>> Function(String? value);

bool _hasMatch(String? value, String pattern) {
  return value != null && RegExp(pattern).hasMatch(value);
}

class FyValidations {
  FyValidations._();

  static String? isRequired(String? value, String? message,
          [bool forceRequired = false]) =>
      value.isNullOrEmpty || forceRequired ? message : null;

  static String? multiple(List<ValueGetter<String?>> validators) {
    for (final validator in validators) {
      final error = validator();
      if (error != null) {
        return error;
      }
    }
    return null;
  }

  static String? isEmail(String? value, String? message) => _hasMatch(value,
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      ? null
      : message;

  static String? isPassword(String? value, String? message) =>
      // Pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial
      _hasMatch(value,
              r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-])')
          ? null
          : message;

  static String? min(String? value, int min, String? message) {
    return (value ?? '').validateLength(min) ? null : message;
  }

  static String? isTrimmed(String? value, String? message) {
    return (value?.startsWith(' ') ?? true) || (value?.endsWith(' ') ?? true)
        ? message
        : null;
  }

  static String? numValueMinMatching(
      String? value, num pattern, String? message) {
    return ((double.tryParse(value ?? '') ?? 0) < pattern) ? message : null;
  }

  static String? numValueMaxMatching(
      String? value, num pattern, String? message) {
    return ((double.tryParse(value ?? '') ?? 0) > pattern) ? message : null;
  }

  static String? isCpf(String? value, String? message) {
    return (value?.isEmpty ?? true) || CpfValidator.isValid(value ?? '')
        ? null
        : message;
  }

  static String? isCnpj(String? value, String? message) {
    return (value?.isEmpty ?? true) || CnpjValidator.isValid(value ?? '')
        ? null
        : message;
  }

  static String? isCpfOrCnpj(
      String? value, String? messageCpf, String? messageCnpj) {
    if (value?.isEmpty ?? true) {
      return null;
    }
    const int cpfMaxLength = 11;
    final strippedValue = CnpjValidator.strip(value ?? '');

    if (strippedValue.length <= cpfMaxLength) {
      if (CpfValidator.isValid(value ?? '')) {
        return null;
      } else {
        return messageCpf;
      }
    } else {
      if (CnpjValidator.isValid(value ?? '')) {
        return null;
      } else {
        return messageCnpj;
      }
    }
  }

  static String? isDate(
    String? value,
    String? message, {
    required int maxPastYears,
    required int minPastYears,
    required int maxFutureYears,
  }) {
    if (value.isNullOrEmpty) {
      return message;
    }

    bool isDateInRange(
      DateTime date,
      int maxPastYears,
      int minPastYears,
      int maxFutureYears,
    ) {
      assert(maxPastYears > minPastYears,
          'A data máxima deve ser maior que a mínima');
      DateTime currentDate = DateTime.now();
      DateTime maxPastDate =
          currentDate.subtract(Duration(days: maxPastYears * 365));
      DateTime minPastDate =
          currentDate.subtract(Duration(days: minPastYears * 365));
      DateTime maxFutureDate =
          currentDate.add(Duration(days: maxFutureYears * 365));

      if (date.isAfter(maxFutureDate) ||
          date.isBefore(maxPastDate) ||
          date.isAfter(minPastDate)) {
        return false;
      }
      return true;
    }

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    DateFormat dateFormatWithoutDay = DateFormat('MM/yyyy');
    DateTime? parsedDate;

    parsedDate = dateFormat.tryParseStrict(value!) ??
        dateFormatWithoutDay.tryParseStrict(value);

    if (parsedDate == null) {
      return message;
    }

    if (!isDateInRange(
      parsedDate,
      maxPastYears,
      minPastYears,
      maxFutureYears,
    )) {
      return message;
    }
    return null; // Data válida
  }
}
