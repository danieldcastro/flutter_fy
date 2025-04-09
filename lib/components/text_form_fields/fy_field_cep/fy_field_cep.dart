import 'package:flutter/services.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/text_form_field_base.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FyFieldCep extends TextFormFieldBase {
  FyFieldCep(super.config, {super.key})
      : super(
            keyboardType: TextInputType.number,
            inputFormatters: [
              MaskTextInputFormatter(
                initialText: config.initialValue,
                mask: '##.###-###',
                filter: {
                  '#': RegExp(r'[0-9]'),
                },
              ),
            ],
            validators: FyValidationTypes.cep(
              config.textFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}
