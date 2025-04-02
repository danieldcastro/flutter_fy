import 'package:flutter/material.dart';

import '../../../result/result.dart';
import '../../../validation/validation_messages.dart';

class TextFormFieldSetup {
  final bool filled;
  final TextStyle titleStyle;
  final TextStyle cursorTextStyle;
  final Color readOnlyTextColor;
  final ValidationMessages validationMessages;
  final ({Color iconColor, Result<String, IconData> icon})? helpTextSetup;
  final ValueChanged<String>? onValidationError;
  final Color? enabledFillColor;
  final Color? readOnlyFillColor;

  TextFormFieldSetup({
    required this.validationMessages,
    required this.titleStyle,
    required this.cursorTextStyle,
    this.helpTextSetup,
    this.onValidationError,
    required this.readOnlyTextColor,
    this.filled = false,
    this.enabledFillColor,
    this.readOnlyFillColor,
  });

  TextFormFieldSetup copyWith({
    TextStyle? titleStyle,
    TextStyle? cursorTextStyle,
    ValidationMessages? validationMessages,
    ({Color iconColor, Result<String, IconData> icon})? helpTextSetup,
    ValueChanged<String>? onValidationError,
    Color? readOnlyTextColor,
    bool? filled,
    Color? enabledFillColor,
    Color? readOnlyFillColor,
  }) {
    return TextFormFieldSetup(
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
}
