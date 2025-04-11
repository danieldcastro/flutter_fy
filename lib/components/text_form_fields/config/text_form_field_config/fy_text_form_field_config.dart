import 'package:flutter/material.dart';

import '../text_form_field_setup/fy_text_form_field_setup.dart';

class FyTextFormFieldConfig {
  final FyTextFormFieldSetup fyTextFormFieldSetup;
  final String? hintText;
  final String? title;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSaved;
  final VoidCallback? onEditingComplete;
  final List<String? Function(String? value)>? requestValidators;
  final TextEditingController? controller;
  final bool? isEnabled;
  final bool? isLoading;
  final ValueChanged<bool>? onFocusChanged;
  final ({
    String title,
    String description,
    TextStyle titleStyle,
    TextStyle descriptionStyle,
  })? helpTextConfigs;

  final String? initialValue;

  ///```dart
  ///obscureText = false
  ///```
  final bool obscureText;

  ///```dart
  ///obscuringCharacter = '•'
  ///```
  final String obscuringCharacter;

  ///```dart
  ///needsFocus = false
  ///```
  final bool needsFocus;

  ///```dart
  ///textInputAction = TextInputAction.done
  ///```
  final TextInputAction? textInputAction;

  ///```dart
  ///isReadOnly = false
  ///```
  final bool isReadOnly;

  ///```dart
  ///isRequired = true
  ///```
  ///* Adiciona o validator isNotEmpty()
  final bool isRequired;

  FyTextFormFieldConfig({
    this.obscuringCharacter = '•',
    required this.fyTextFormFieldSetup,
    this.helpTextConfigs,
    this.hintText,
    this.title,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onFieldSubmitted,
    this.requestValidators,
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.isRequired = true,
    this.isReadOnly = false,
    this.needsFocus = false,
    this.isEnabled,
    this.isLoading,
    this.obscureText = false,
    this.onFocusChanged,
  });

  FyTextFormFieldConfig copyWith({
    FyTextFormFieldSetup? fyTextFormFieldSetup,
    String? hintText,
    String? title,
    String? initialValue,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    ValueChanged<String?>? onSaved,
    VoidCallback? onEditingComplete,
    List<String? Function(String? value)>? requestValidators,
    String? obscuringCharacter,
    bool? needsFocus,
    TextInputAction? textInputAction,
    bool? isReadOnly,
    bool? isRequired,
    bool? isEnabled,
    TextEditingController? controller,
    bool? isLoading,
    bool? obscureText,
    ValueChanged<bool>? onFocusChanged,
    ({
      String title,
      String description,
      TextStyle titleStyle,
      TextStyle descriptionStyle,
    })? helpTextConfigs,
  }) {
    return FyTextFormFieldConfig(
      fyTextFormFieldSetup: fyTextFormFieldSetup ?? this.fyTextFormFieldSetup,
      hintText: hintText ?? this.hintText,
      title: title ?? this.title,
      initialValue: initialValue ?? this.initialValue,
      onChanged: onChanged ?? this.onChanged,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onSaved: onSaved ?? this.onSaved,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      requestValidators: requestValidators ?? this.requestValidators,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      needsFocus: needsFocus ?? this.needsFocus,
      textInputAction: textInputAction ?? this.textInputAction,
      isReadOnly: isReadOnly ?? this.isReadOnly,
      isRequired: isRequired ?? this.isRequired,
      isEnabled: isEnabled ?? this.isEnabled,
      controller: controller ?? this.controller,
      isLoading: isLoading ?? this.isLoading,
      helpTextConfigs: helpTextConfigs ?? this.helpTextConfigs,
      obscureText: obscureText ?? this.obscureText,
      onFocusChanged: onFocusChanged ?? this.onFocusChanged,
    );
  }
}
