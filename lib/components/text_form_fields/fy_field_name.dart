import 'package:flutter/services.dart';

import '../../utils/validation/fy_validation_types.dart';
import 'setup/text_form_field_base.dart';

class FyFieldName extends TextFormFieldBase {
  FyFieldName(
    super.config, {
    super.key,
  }) : super(
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z\sá-úÁ-Úã-õÃ-Õâ-ôÂ-ÔçÇ]'))
            ],
            textCapitalization: TextCapitalization.words,
            validators: FyValidationTypes.onlyRequests(
              config.requestValidators,
            ));
}
