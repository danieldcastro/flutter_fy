import 'package:flutter_fy/utils/enums/validation_messages_enum.dart';

class FyValidationMessages {
  final Map<ValidationMessagesEnum, String> messages;

  FyValidationMessages({required this.messages});

  String? get requiredField => messages[ValidationMessagesEnum.requiredField];
  String? get invalidEmail => messages[ValidationMessagesEnum.invalidEmail];
  String? get invalidPassword =>
      messages[ValidationMessagesEnum.invalidPassword];
  String? get passwordTooShort =>
      messages[ValidationMessagesEnum.passwordTooShort];
  String? get passwordStartEndsWithSpace =>
      messages[ValidationMessagesEnum.passwordStartEndsWithSpace];
  String? get invalidCurrency =>
      messages[ValidationMessagesEnum.invalidCurrency];
  String? get invalidCpf => messages[ValidationMessagesEnum.invalidCpf];
  String? get invalidCnpj => messages[ValidationMessagesEnum.invalidCnpj];
  String? get invalidNumber => messages[ValidationMessagesEnum.invalidNumber];
  String? get invalidCep => messages[ValidationMessagesEnum.invalidCep];
  String? get invalidRg => messages[ValidationMessagesEnum.invalidRg];
  String? get invalidDate => messages[ValidationMessagesEnum.invalidDate];

  String? getMessage(ValidationMessagesEnum key) => messages[key];

  String? operator [](ValidationMessagesEnum key) => messages[key];

  FyValidationMessages copyWith(
      Map<ValidationMessagesEnum, String> newMessages) {
    return FyValidationMessages(
      messages: {...messages, ...newMessages},
    );
  }
}
