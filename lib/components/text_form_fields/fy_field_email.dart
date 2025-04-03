import 'package:flutter/services.dart';

import '../../utils/validation/fy_validation_types.dart';
import 'setup/text_form_field_base.dart';

class FyFieldEmail extends TextFormFieldBase {
  FyFieldEmail(
    super.config, {
    super.key,
  }) : super(
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [FilteringTextInputFormatter.deny(' ')],
            validators: FyValidationTypes.email(
              config.textFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}
