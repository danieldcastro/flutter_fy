import 'package:flutter/material.dart';

import '../../../../utils/result/result.dart';
import '../../../../utils/validation/fy_validation_messages/fy_validation_messages.dart';

class FyTextFormFieldSetup {
  final bool filled;
  final TextStyle titleStyle;
  final TextStyle cursorTextStyle;
  final Color readOnlyTextColor;
  final FyValidationMessages validationMessages;
  final ({Color iconColor, Result<String, IconData> icon})? helpTextSetup;
  final ValueChanged<String>? onValidationError;
  final Color? enabledFillColor;
  final Color? readOnlyFillColor;

  FyTextFormFieldSetup({
    required this.validationMessages,
    required this.titleStyle,
    required this.cursorTextStyle,
    required this.readOnlyTextColor, this.helpTextSetup,
    this.onValidationError,
    this.filled = false,
    this.enabledFillColor,
    this.readOnlyFillColor,
  });

  FyTextFormFieldSetup copyWith({
    TextStyle? titleStyle,
    TextStyle? cursorTextStyle,
    FyValidationMessages? validationMessages,
    ({Color iconColor, Result<String, IconData> icon})? helpTextSetup,
    ValueChanged<String>? onValidationError,
    Color? readOnlyTextColor,
    bool? filled,
    Color? enabledFillColor,
    Color? readOnlyFillColor,
  }) => FyTextFormFieldSetup(
      titleStyle: titleStyle ?? this.titleStyle,
      cursorTextStyle: cursorTextStyle ?? this.cursorTextStyle,
      validationMessages: validationMessages ?? this.validationMessages,
      helpTextSetup: helpTextSetup ?? this.helpTextSetup,
      onValidationError: onValidationError ?? this.onValidationError,
      readOnlyTextColor: readOnlyTextColor ?? this.readOnlyTextColor,
      filled: filled ?? this.filled,
      enabledFillColor: enabledFillColor ?? this.enabledFillColor,
      readOnlyFillColor: readOnlyFillColor ?? this.readOnlyFillColor,
    );
}
