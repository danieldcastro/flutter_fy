import 'package:flutter/services.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';

class BelFieldText extends TextFormFieldBase {
  BelFieldText(
    super.config, {
    super.maxLength,
    super.key,
  }) : super(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            validators: ValidationTypes.onlyRequests(
              config.requestValidators,
            ));
}
