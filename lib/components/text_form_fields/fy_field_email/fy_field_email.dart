import 'package:flutter/services.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/text_form_field_base.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';

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
