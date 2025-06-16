import 'package:flutter/services.dart';

import '../../../utils/validation/fy_validation_types.dart';
import '../config/text_form_field_base/fy_text_form_field_base.dart';

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
