import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../utils/validation/fy_validation_types.dart';
import '../config/text_form_field_base/fy_text_form_field_base.dart';

class FyFieldDate extends FyTextFormFieldBase {
  final bool hasDay;
  final int maxPastYears;
  final int minPastYears;
  final int maxFutureYears;
  FyFieldDate(
    super.config, {
    super.key,
    this.hasDay = true,
    this.maxPastYears = 130,
    this.minPastYears = 0,
    this.maxFutureYears = 130,
  }) : super(
            keyboardType: TextInputType.datetime,
            inputFormatters: [
              MaskTextInputFormatter(
                initialText: config.initialValue,
                mask: hasDay ? '##/##/####' : '##/####',
                filter: {
                  '#': RegExp(r'[0-9]'),
                },
              ),
            ],
            validators: FyValidationTypes.date(
              config.fyTextFormFieldSetup.validationMessages,
              config.requestValidators,
              maxPastYears: maxPastYears,
              minPastYears: minPastYears,
              maxFutureYears: maxFutureYears,
            ));
}
