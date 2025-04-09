import 'package:flutter/material.dart';

import 'dropdown_setup.dart';

class DropdownConfig<T> {
  final DropdownSetup dropdownSetup;
  final String? hintText;
  final String? title;
  final ValueChanged<T?>? onChanged;
  final T? initialValue;
  final double? menuMaxHeight;
  final bool mustSelectItemOnChange;
  final String Function(T value)? customItemTextFormat;

  ///```dart
  ///isReadOnly = false
  ///```
  final bool isReadOnly;

  ///```dart
  ///isRequired = true
  ///```
  ///* Adiciona o validator isNotEmpty()
  final bool isRequired;

  DropdownConfig({
    required this.dropdownSetup,
    this.menuMaxHeight,
    this.isRequired = true,
    this.isReadOnly = false,
    this.initialValue,
    this.hintText,
    this.title,
    this.onChanged,
    this.mustSelectItemOnChange = true,
    this.customItemTextFormat,
  });
}
