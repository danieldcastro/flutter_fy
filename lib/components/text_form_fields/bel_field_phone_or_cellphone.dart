import 'package:flutter/services.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';

class BelFieldPhoneOrCellphone extends TextFormFieldBase {
  final bool isCellphone;
  @override
  BelFieldPhoneOrCellphone(super.config, {super.key, this.isCellphone = true})
      : super(
            keyboardType: TextInputType.number,
            maxLength: isCellphone ? 15 : 14,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              _PhoneFormatter(isCellphone: isCellphone)
            ],
            validators: ValidationTypes.phoneCellphone(
              config.textFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}

class _PhoneFormatter extends TextInputFormatter {
  final bool isCellphone;

  _PhoneFormatter({
    required this.isCellphone,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(
        text: '',
      );
    }

    // Remove caracteres não numéricos do novo valor
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Aplica a formatação específica para os dois formatos
    if (cleanedText.length <= 10 || !isCellphone) {
      // (00) 0000-0000
      cleanedText = _formatPhoneNumberWithAreaCode(cleanedText);
    } else {
      // (00) 00000-0000
      cleanedText = _formatPhoneNumberWithAreaCodeAndExtraDigits(cleanedText);
    }

    return newValue.copyWith(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  String _formatPhoneNumberWithAreaCode(String text) {
    if (text.length <= 2) {
      return '($text';
    } else if (text.length <= 6) {
      return '(${text.substring(0, 2)}) ${text.substring(2)}';
    } else {
      return '(${text.substring(0, 2)}) ${text.substring(2, 6)}-${text.substring(6, text.length >= 10 ? 10 : null)}';
    }
  }

  String _formatPhoneNumberWithAreaCodeAndExtraDigits(String text) {
    if (text.length <= 2) {
      return '($text';
    } else if (text.length <= 7) {
      return '(${text.substring(0, 2)}) ${text.substring(2)}';
    } else {
      return '(${text.substring(0, 2)}) ${text.substring(2, 7)}-${text.substring(7)}';
    }
  }
}
