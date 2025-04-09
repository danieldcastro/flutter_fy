import 'package:flutter/services.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/text_form_field_base.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FyFieldCpf extends TextFormFieldBase {
  FyFieldCpf(super.config, {super.key})
      : super(
            keyboardType: TextInputType.number,
            maxLength: 14,
            validators: FyValidationTypes.cpf(
              config.textFormFieldSetup.validationMessages,
              config.requestValidators,
            ),
            inputFormatters: [
              MaskTextInputFormatter(
                initialText: config.initialValue,
                mask: '###.###.###-##',
                filter: {
                  '#': RegExp(r'[0-9]'),
                },
              ),
            ]);
}
