import 'package:flutter/material.dart';

import '../../../validation/fy_validation_messages.dart';

class DropdownSetup {
  final Color disabledColor;
  final Color disabledTextColor;
  final TextStyle titleStyle;
  final TextStyle valueTextStyle;
  final FyValidationMessages validationMessages;
  final ValueChanged<String>? onValidationError;
  final Color dropdownColor;
  final ({
    IconData icon,
    Color iconColor,
    Color disabledIconColor,
  }) dropDownIconConfigs;
  final InputDecoration? decoration;

  DropdownSetup(
      {required this.disabledColor,
      required this.disabledTextColor,
      required this.titleStyle,
      required this.valueTextStyle,
      required this.validationMessages,
      required this.dropDownIconConfigs,
      this.onValidationError,
      this.dropdownColor = Colors.white,
      this.decoration});

  DropdownSetup copyWith({
    Color? disabledColor,
    Color? disabledTextColor,
    TextStyle? titleStyle,
    TextStyle? valueTextStyle,
    FyValidationMessages? validationMessages,
    ValueChanged<String>? onValidationError,
    Color? dropdownColor,
    InputDecoration? decoration,
    ({
      IconData icon,
      Color iconColor,
      Color disabledIconColor,
    })? dropDownIconConfigs,
  }) {
    return DropdownSetup(
      disabledColor: disabledColor ?? this.disabledColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      titleStyle: titleStyle ?? this.titleStyle,
      valueTextStyle: valueTextStyle ?? this.valueTextStyle,
      validationMessages: validationMessages ?? this.validationMessages,
      onValidationError: onValidationError ?? this.onValidationError,
      dropdownColor: dropdownColor ?? this.dropdownColor,
      dropDownIconConfigs: dropDownIconConfigs ?? this.dropDownIconConfigs,
      decoration: decoration ?? this.decoration,
    );
  }
}
