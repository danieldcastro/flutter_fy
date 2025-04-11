import 'package:flutter/material.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_base/fy_text_form_field_base.dart';
import 'package:flutter_fy/components/text_form_fields/config/text_form_field_config/fy_text_form_field_config.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FyFieldDatePicker extends StatelessWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime?> onSelectDate;
  final DateTime? initialDate;
  final DatePickerMode initialDatePickerMode;
  final DatePickerEntryMode initialEntryMode;
  final TextEditingController controller;
  final FyTextFormFieldConfig config;

  const FyFieldDatePicker({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.onSelectDate,
    required this.controller,
    required this.config,
    this.initialDate,
    this.initialDatePickerMode = DatePickerMode.day,
    this.initialEntryMode = DatePickerEntryMode.calendarOnly,
  });

  @override
  Widget build(BuildContext context) {
    return FyTextFormFieldBase(
      config.copyWith(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(
            LucideIcons.calendar,
            color:
                config.fyTextFormFieldSetup.cursorTextStyle.color ?? Colors.red,
          ),
        ),
      ),
      onTap: (context) async {
        DateFormat dateFormat = DateFormat('dd/MM/yyyy');
        final selectedDate = dateFormat.tryParseStrict(controller.text);
        DateTime dateWithoutTime(DateTime date) =>
            DateTime(date.year, date.month, date.day);

        final pickedDate = await showDatePicker(
          context: context,
          firstDate: dateWithoutTime(firstDate),
          lastDate: dateWithoutTime(lastDate),
          initialDate:
              selectedDate ?? dateWithoutTime(initialDate ?? firstDate),
          keyboardType: TextInputType.datetime,
          initialDatePickerMode: initialDatePickerMode,
          initialEntryMode: initialEntryMode,
        );

        if (pickedDate != null &&
            !pickedDate.isBefore(dateWithoutTime(firstDate)) &&
            !pickedDate.isAfter(dateWithoutTime(lastDate))) {
          controller.text = dateFormat.format(pickedDate);
          onSelectDate(pickedDate);
        }

        return pickedDate;
      },
      keyboardType: TextInputType.datetime,
      maxLines: 1,
    );
  }
}
