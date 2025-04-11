import 'package:flutter/services.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/fy_text_form_field_base.dart';
import 'package:flutter_fy/utils/input_formatters/phone_input_formatter/fy_phone_input_formatter.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';

class FyFieldPhoneOrCellphone extends FyTextFormFieldBase {
  final bool isCellphone;
  @override
  FyFieldPhoneOrCellphone(super.config, {super.key, this.isCellphone = true})
      : super(
            keyboardType: TextInputType.number,
            maxLength: isCellphone ? 15 : 14,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FyPhoneFormatter(isCellphone: isCellphone)
            ],
            validators: FyValidationTypes.phoneCellphone(
              config.fyTextFormFieldSetup.validationMessages,
              config.requestValidators,
            ));
}
