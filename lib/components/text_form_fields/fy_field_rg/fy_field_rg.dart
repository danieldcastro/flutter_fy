import 'package:flutter/services.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/fy_text_form_field_base.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';

class FyFieldRg extends FyTextFormFieldBase {
  FyFieldRg(super.config, {super.key})
      : super(
          keyboardType: TextInputType.number,
          maxLength: 25,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'[^\w\s]|_'))
          ],
          validators: FyValidationTypes.rg(
            config.fyTextFormFieldSetup.validationMessages,
            config.requestValidators,
          ),
        );
}
