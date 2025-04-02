import 'package:flutter/material.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';
import 'setup/text_form_field_config.dart';

class BelFieldPassword extends StatefulWidget {
  final int minLength;
  final TextFormFieldConfig config;

  ///TextFormField para senha
  ///Validators:
  ///- Número mínimo de caracteres (passado por parâmetro);
  ///- Se existe espaço em branco no começo ou no fim;
  ///- Regra de criação de senha (Pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial)
  const BelFieldPassword(
    this.config, {
    required this.minLength,
    super.key,
  });

  @override
  State<BelFieldPassword> createState() => _BelFieldPasswordState();
}

class _BelFieldPasswordState extends State<BelFieldPassword> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormFieldBase(widget.config,
        keyboardType: TextInputType.visiblePassword,
        suffixIcon: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => setState(() {
            obscureText = !obscureText;
          }),
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        obscureText: obscureText,
        validators: ValidationTypes.password(
          widget.config.textFormFieldSetup.validationMessages,
          widget.config.requestValidators,
          widget.minLength,
        ));
  }
}
