import 'package:flutter/services.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';

class BelFieldEmail extends TextFormFieldBase {
  BelFieldEmail(
    super.config, {
    super.key,
  }) : super(
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [FilteringTextInputFormatter.deny(' ')],
            validators: ValidationTypes.email(
              config.textFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}
