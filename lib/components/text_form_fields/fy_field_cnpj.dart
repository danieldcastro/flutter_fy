import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../utils/validation/fy_validation_types.dart';
import 'config/text_form_field_base.dart';

class FyFieldCnpj extends TextFormFieldBase {
  FyFieldCnpj(super.config, {super.key})
      : super(
            keyboardType: TextInputType.number,
            maxLength: 18,
            validators: FyValidationTypes.cnpj(
              config.textFormFieldSetup.validationMessages,
              config.requestValidators,
            ),
            inputFormatters: [
              MaskTextInputFormatter(
                initialText: config.initialValue,
                mask: '##.###.###/####-##',
                filter: {
                  '#': RegExp(r'[0-9]'),
                },
              ),
            ]);
}
