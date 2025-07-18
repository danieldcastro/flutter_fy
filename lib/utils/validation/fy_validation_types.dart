import 'package:flutter/material.dart';
import '../extensions/list_extensions/list_extensions.dart';

import '../extensions/string_extensions/string_extensions.dart';
import 'fy_validation_messages/fy_validation_messages.dart';
import 'fy_validations.dart';

class FyValidationTypes {
  FyValidationTypes._();

  static List<String? Function()> _buildValidatorsList(
    String? value,
    List<String? Function(String? value)>? requestValidators, [
    List<ValueGetter<String?>>? validators,
    List<String? Function(String? value)>? customValidators,
  ]) {
    final List<ValueGetter<String?>> localValidators = validators ?? [];
    if (requestValidators != null) {
      for (final validator in requestValidators) {
        localValidators.add(() => validator(value));
      }
    }
    if (customValidators != null) {
      for (final validator in customValidators) {
        localValidators.add(() => validator(value));
      }
    }
    return localValidators;
  }

  static ValidatorsCallBack email(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [() => FyValidations.isEmail(value, messages.invalidEmail)],
        );

  static ValidatorsCallBack password(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
    int minLength,
    List<String? Function(String? value)>? customValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () =>
                FyValidations.min(value, minLength, messages.passwordTooShort),
            () => FyValidations.isTrimmed(
                value, messages.passwordStartEndsWithSpace),
            if (customValidators.isNullOrEmpty)
              () => FyValidations.isPassword(value, messages.invalidPassword)
          ],
          customValidators,
        );

  static ValidatorsCallBack currency(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
    double? numValueMinMatching,
    double? numValueMaxMatching,
    bool isRequired,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            if (isRequired && int.tryParse(value?.removeNonDigits ?? '') == 0)
              () =>
                  FyValidations.isRequired(value, messages.requiredField, true),
            if (numValueMinMatching != null)
              () => FyValidations.numValueMinMatching(
                    value?.prepareCurrencyForParsing,
                    numValueMinMatching,
                    messages.invalidCurrency,
                  ),
            if (numValueMaxMatching != null)
              () => FyValidations.numValueMaxMatching(
                    value?.prepareCurrencyForParsing,
                    numValueMaxMatching,
                    messages.invalidCurrency,
                  ),
          ],
        );

  static ValidatorsCallBack onlyRequests(
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(value, requestValidators);

  static ValidatorsCallBack cpf(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () => FyValidations.isCpf(value, messages.invalidCpf),
          ],
        );

  static ValidatorsCallBack cnpj(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () => FyValidations.isCnpj(value, messages.invalidCnpj),
          ],
        );

  static ValidatorsCallBack cpfCnpj(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () => FyValidations.isCpfOrCnpj(
                value, messages.invalidCpf, messages.invalidCnpj),
          ],
        );

  static ValidatorsCallBack phoneCellphone(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () => FyValidations.min(
                value?.removeNonDigits, 10, messages.invalidNumber),
          ],
        );

  static ValidatorsCallBack cep(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () => FyValidations.min(
                value?.removeNonDigits, 8, messages.invalidCep),
          ],
        );

  static ValidatorsCallBack rg(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators,
  ) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () => FyValidations.min(
                value?.removeSpecialCharacters, 4, messages.invalidRg),
          ],
        );

  static ValidatorsCallBack date(
    FyValidationMessages messages,
    List<String? Function(String? value)>? requestValidators, {
    required int maxPastYears,
    required int minPastYears,
    required int maxFutureYears,
  }) => (String? value) => _buildValidatorsList(
          value,
          requestValidators,
          [
            () => FyValidations.isDate(
                  value,
                  messages.invalidDate,
                  maxPastYears: maxPastYears,
                  minPastYears: minPastYears,
                  maxFutureYears: maxFutureYears,
                ),
          ],
        );
}
