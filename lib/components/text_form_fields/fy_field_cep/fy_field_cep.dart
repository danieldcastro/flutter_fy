import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../utils/validation/fy_validation_types.dart';
import '../config/text_form_field_base/fy_text_form_field_base.dart';

class FyFieldCep extends FyTextFormFieldBase {
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
              config.fyTextFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}
