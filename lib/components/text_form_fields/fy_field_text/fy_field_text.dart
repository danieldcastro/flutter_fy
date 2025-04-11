import 'package:flutter/services.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/fy_text_form_field_base.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';

class FyFieldText extends FyTextFormFieldBase {
  FyFieldText(
    super.config, {
    super.maxLength,
    super.key,
  }) : super(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            validators: FyValidationTypes.onlyRequests(
              config.requestValidators,
            ));
}
