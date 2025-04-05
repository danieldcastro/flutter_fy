import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'config/text_form_field_base.dart';

class FyFieldDatePicker extends TextFormFieldBase {
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime?> onSelectDate;
  final DateTime? initialDate;
  final DatePickerMode initialDatePickerMode;
  final DatePickerEntryMode initialEntryMode;
  FyFieldDatePicker(
    super.config, {
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.onSelectDate,
    this.initialDate,
    this.initialDatePickerMode = DatePickerMode.day,
    this.initialEntryMode = DatePickerEntryMode.calendarOnly,
  }) : super(
            onTap: (context) async {
              DateFormat dateFormat = DateFormat('dd/MM/yyyy');
              final selectedDate =
                  dateFormat.tryParseStrict(config.controller?.text ?? '');
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
                config.controller?.text = dateFormat.format(pickedDate);
                onSelectDate(pickedDate);
              }

              return pickedDate;
            },
            keyboardType: TextInputType.datetime,
            maxLines: 1,
            suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  LucideIcons.calendar,
                  color: config.textFormFieldSetup.cursorTextStyle.color ??
                      Colors.red,
                )));
}
