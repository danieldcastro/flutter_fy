import 'package:flutter/material.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/fy_text_form_field_base.dart';
import 'package:flutter_fy/utils/validation/fy_validation_types.dart';

import '../config/text_form_field_config/fy_text_form_field_config.dart';

class FyFieldPassword extends StatefulWidget {
  final int minLength;
  final List<String? Function(String? value)>? customValidators;
  final FyTextFormFieldConfig config;

  ///TextFormField para senha
  ///Validators:
  ///- Número mínimo de caracteres (passado por parâmetro);
  ///- Se existe espaço em branco no começo ou no fim;
  ///- Regra de criação de senha (Pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial)
  const FyFieldPassword(
    this.config, {
    required this.minLength,
    this.customValidators,
    super.key,
  });

  @override
  State<FyFieldPassword> createState() => _FyFieldPasswordState();
}

class _FyFieldPasswordState extends State<FyFieldPassword> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return FyTextFormFieldBase(widget.config,
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscureText,
        validators: FyValidationTypes.password(
          widget.config.fyTextFormFieldSetup.validationMessages,
          widget.config.requestValidators,
          widget.minLength,
          widget.customValidators,
        ));
  }
}
