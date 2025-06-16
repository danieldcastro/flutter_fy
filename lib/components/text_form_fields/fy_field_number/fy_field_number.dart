import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/validation/fy_validation_types.dart';
import '../config/text_form_field_base/fy_text_form_field_base.dart';
import '../config/text_form_field_config/fy_text_form_field_config.dart';

class FyFieldNumber extends StatelessWidget {
  final Widget? suffix;
  final FyTextFormFieldConfig config;
  const FyFieldNumber(
    this.config, {
    this.suffix,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, constraints) => FyTextFormFieldBase(
        config.copyWith(
          suffixIcon: suffix,
          suffixIconMaxWidth: constraints.maxWidth / 2,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.deny(' '),
          FilteringTextInputFormatter.digitsOnly
        ],
        validators: FyValidationTypes.onlyRequests(
          config.requestValidators,
        ),
      ));
}
