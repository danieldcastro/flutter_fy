import 'package:flutter/services.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/fy_text_form_field_base.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';

class FyFieldName extends FyTextFormFieldBase {
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
