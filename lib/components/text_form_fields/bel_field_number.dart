import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';
import 'setup/text_form_field_config.dart';

class BelFieldNumber extends StatelessWidget {
  final Widget? suffix;
  final TextFormFieldConfig config;
  const BelFieldNumber(
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
        validators: ValidationTypes.onlyRequests(
          config.requestValidators,
        ),
        suffixIcon: suffix,
        suffixIconMaxWidth: constraints.maxWidth / 2,
      );
    });
  }
}
