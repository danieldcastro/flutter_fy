import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fy/components/input_formatters/decimal_text_input_formatter.dart';
import 'package:flutter_fy/enums/fy_locales.dart';

import '../../validation/validation_types.dart';
import 'setup/text_form_field_base.dart';
import 'setup/text_form_field_config.dart';

class BelFieldCurrency extends StatefulWidget {
  final TextFormFieldConfig config;
  final double? numValueMinMatching;
  final double? numValueMaxMatching;
  final FyLocales locale;
  final int maxLength;

  const BelFieldCurrency(
    this.config, {
    this.maxLength = 24,
    this.locale = FyLocales.ptBR,
    this.numValueMinMatching,
    this.numValueMaxMatching,
    super.key,
  });

  @override
  State<BelFieldCurrency> createState() => _BelFieldCurrencyState();
}

class _BelFieldCurrencyState extends State<BelFieldCurrency> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.config.controller ?? TextEditingController();
    _controller.text = widget.config.initialValue ?? widget.locale.emptyValue;
    _controller.addListener(_keepEmpty);
  }

  void _keepEmpty() {
    if (_controller.text.isEmpty) {
      _controller.text = widget.locale.emptyValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormFieldBase(
      widget.config.copyWith(controller: _controller),
      maxLength: widget.maxLength,
      keyboardType: TextInputType.number,
      prefix: Text(
        '${widget.locale.symbol} ',
        style: widget.config.textFormFieldSetup.cursorTextStyle.copyWith(
            color: widget.config.isReadOnly
                ? widget.config.textFormFieldSetup.readOnlyTextColor
                : null),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DecimalTextInputFormatter(),
      ],
      validators: ValidationTypes.currency(
        widget.config.textFormFieldSetup.validationMessages,
        widget.config.requestValidators,
        widget.numValueMinMatching,
        widget.numValueMaxMatching,
        widget.config.isRequired,
      ),
    );
  }
}
