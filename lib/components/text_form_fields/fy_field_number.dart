import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/validation/fy_validation_types.dart';
import 'setup/text_form_field_base.dart';
import 'setup/text_form_field_config.dart';

class FyFieldNumber extends StatelessWidget {
  final Widget? suffix;
  final TextFormFieldConfig config;
  const FyFieldNumber(
    this.config, {
    this.suffix,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return TextFormFieldBase(
        config,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.deny(' '),
          FilteringTextInputFormatter.digitsOnly
        ],
        validators: FyValidationTypes.onlyRequests(
          config.requestValidators,
        ),
        suffixIcon: suffix,
        suffixIconMaxWidth: constraints.maxWidth / 2,
      );
    });
  }
}
