import 'package:flutter/services.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';

class BelFieldRg extends TextFormFieldBase {
  BelFieldRg(super.config, {super.key})
      : super(
          keyboardType: TextInputType.number,
          maxLength: 25,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'[^\w\s]|_'))
          ],
          validators: ValidationTypes.rg(
            config.textFormFieldSetup.validationMessages,
            config.requestValidators,
          ),
        );
}
