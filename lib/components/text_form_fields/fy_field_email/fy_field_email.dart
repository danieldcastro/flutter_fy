import 'package:flutter/services.dart';

import '../../../utils/validation/fy_validation_types.dart';
import '../config/text_form_field_base/fy_text_form_field_base.dart';

class FyFieldEmail extends FyTextFormFieldBase {
  FyFieldEmail(
    super.config, {
    super.key,
  }) : super(
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [FilteringTextInputFormatter.deny(' ')],
            validators: FyValidationTypes.email(
              config.fyTextFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}
