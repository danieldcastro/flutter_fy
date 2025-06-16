import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/enums/fy_locales/fy_locales.dart';
import '../../../utils/input_formatters/decimal_text_input_formatter/fy_decimal_text_input_formatter.dart';
import '../../../utils/validation/fy_validation_types.dart';
import '../config/text_form_field_base/fy_text_form_field_base.dart';
import '../config/text_form_field_config/fy_text_form_field_config.dart';

class FyFieldCurrency extends StatefulWidget {
  final FyTextFormFieldConfig config;
  final double? numValueMinMatching;
  final double? numValueMaxMatching;
  final FyLocales locale;
  final int decimalDigits;
  final int maxLength;

  const FyFieldCurrency(
    this.config, {
    this.maxLength = 24,
    this.decimalDigits = 2,
    this.locale = FyLocales.ptBR,
    this.numValueMinMatching,
    this.numValueMaxMatching,
    super.key,
  });

  @override
  State<FyFieldCurrency> createState() => _FyFieldCurrencyState();
}

class _FyFieldCurrencyState extends State<FyFieldCurrency> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.config.controller ?? TextEditingController();
    _controller
      ..text = widget.config.initialValue ?? widget.locale.emptyValue
      ..addListener(_keepEmpty);
  }

  void _keepEmpty() {
    if (_controller.text.isEmpty) {
      _controller.text = widget.locale.emptyValue;
    }
  }

  @override
  void dispose() {
    if (widget.config.controller == null) {
      _controller.dispose();
    }
    _controller.removeListener(_keepEmpty);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FyTextFormFieldBase(
        widget.config.copyWith(
          controller: _controller,
          prefix: Text(
            '${widget.locale.symbol} ',
            style: widget.config.fyTextFormFieldSetup.cursorTextStyle.copyWith(
                color: widget.config.isReadOnly
                    ? widget.config.fyTextFormFieldSetup.readOnlyTextColor
                    : null),
          ),
        ),
        maxLength: widget.maxLength,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FyDecimalTextInputFormatter(
            currencySymbol: widget.locale.symbol,
            decimalDigits: widget.decimalDigits,
          ),
        ],
        validators: FyValidationTypes.currency(
          widget.config.fyTextFormFieldSetup.validationMessages,
          widget.config.requestValidators,
          widget.numValueMinMatching,
          widget.numValueMaxMatching,
          widget.config.isRequired,
        ),
      );
}
