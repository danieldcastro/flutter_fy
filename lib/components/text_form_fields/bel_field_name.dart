import 'package:flutter/services.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';

class BelFieldName extends TextFormFieldBase {
  BelFieldName(
    super.config, {
    super.key,
  }) : super(
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z\sá-úÁ-Úã-õÃ-Õâ-ôÂ-ÔçÇ]'))
            ],
            textCapitalization: TextCapitalization.words,
            validators: ValidationTypes.onlyRequests(
              config.requestValidators,
            ));
}
