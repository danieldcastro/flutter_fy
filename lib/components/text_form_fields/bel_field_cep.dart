import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';

class BelFieldCep extends TextFormFieldBase {
  BelFieldCep(super.config, {super.key})
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
            validators: ValidationTypes.cep(
              config.textFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}
