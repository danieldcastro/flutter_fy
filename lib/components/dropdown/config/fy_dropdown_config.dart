import 'package:flutter/material.dart';

import 'fy_dropdown_setup.dart';

class FyDropdownConfig<T> {
  final FyDropdownSetup fyDropdownSetup;
  final String? hintText;
  final String? title;
  final ValueChanged<T?>? onChanged;
  final T? initialValue;
  final double? menuMaxHeight;
  final bool mustSelectItemOnChange;
  final String Function(T value)? customItemText;
  final Widget Function(T value)? customItemWidget;

  ///```dart
  ///isReadOnly = false
  ///```
  final bool isReadOnly;

  ///```dart
  ///isRequired = true
  ///```
  ///* Adiciona o validator isNotEmpty()
  final bool isRequired;

  FyDropdownConfig({
    required this.fyDropdownSetup,
    this.menuMaxHeight,
    this.isRequired = true,
    this.isReadOnly = false,
    this.initialValue,
    this.hintText,
    this.title,
    this.onChanged,
    this.mustSelectItemOnChange = true,
    this.customItemText,
    this.customItemWidget,
  }) {
    assert(
      !(customItemText != null && customItemWidget != null),
      'customItemText e customItemWidget não podem ser usados juntos',
    );
  }
}
