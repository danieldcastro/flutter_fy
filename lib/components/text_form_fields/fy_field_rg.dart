import 'package:flutter/services.dart';

import '../../utils/validation/fy_validation_types.dart';
import 'config/text_form_field_base.dart';

class FyFieldRg extends TextFormFieldBase {
  FyFieldRg(super.config, {super.key})
      : super(
          keyboardType: TextInputType.number,
          maxLength: 25,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'[^\w\s]|_'))
          ],
          validators: FyValidationTypes.rg(
            config.textFormFieldSetup.validationMessages,
            config.requestValidators,
          ),
        );
}
