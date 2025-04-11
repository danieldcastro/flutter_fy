import 'package:flutter/material.dart';

import '../../utils/extensions/string_extensions/string_extensions.dart';
import '../../utils/validation/fy_validations.dart';
import 'config/fy_dropdown_config.dart';

class FyDropdown<T> extends StatefulWidget {
  final FyDropdownConfig<T> config;
  final List<T> values;
  const FyDropdown({super.key, required this.values, required this.config});

  @override
  State<FyDropdown<T>> createState() => _FyDropdownState<T>();
}

class _FyDropdownState<T> extends State<FyDropdown<T>> {
  String? _errorText;
  late FocusNode _focusNode;
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_handleFocusChange);
  }

  String _formattedText(T value) {
    return widget.config.customItemText != null
        ? widget.config.customItemText!(value)
        : value.toString();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      String? validationResult =
          _validator(_selectedValue, requestFocus: false);
      setState(() {
        _errorText = validationResult;
      });
    } else {
      setState(() {
        _errorText = null;
      });
    }
  }

  String? _validator(T? value, {bool requestFocus = true}) {
    if (!widget.config.isRequired &&
        widget.config.initialValue == null &&
        value == null) {
      return null;
    } else {
      String? validation = FyValidations.multiple([
        if (widget.config.isRequired)
          () => FyValidations.isRequired(
              _formattedText(value ?? widget.config.initialValue!),
              widget.config.fyDropdownSetup.validationMessages.requiredField),
      ]);
      if (validation.isNullOrEmpty) {
        return null;
      } else {
        if (widget.config.fyDropdownSetup.onValidationError != null &&
            requestFocus) {
          _focusNode.requestFocus();
          widget.config.fyDropdownSetup.onValidationError!(validation ?? '');
        }
        return validation;
      }
    }
  }

  InputDecoration get _decoration => InputDecoration(
      errorText: _errorText,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      filled: widget.config.isReadOnly ||
          (widget.config.fyDropdownSetup.decoration?.filled ?? false),
      fillColor: widget.config.isReadOnly
          ? widget.config.fyDropdownSetup.disabledColor
          : widget.config.fyDropdownSetup.decoration?.fillColor);

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.config.title != null) ...[
            SelectionArea(
              child: Text(
                  widget.config.isRequired
                      ? (widget.config.title ?? '').addAsteriskPrefix
                      : (widget.config.title ?? ''),
                  style: widget.config.fyDropdownSetup.titleStyle),
            ),
            const SizedBox(height: 8),
          ],
          IgnorePointer(
            ignoring: widget.config.isReadOnly || widget.values.isEmpty,
            child: DropdownButtonFormField<T>(
              focusColor: Colors.transparent,
              focusNode: _focusNode,
              decoration: widget.config.fyDropdownSetup.decoration?.copyWith(
                      errorText: _decoration.errorText,
                      hoverColor: _decoration.hoverColor,
                      focusColor: _decoration.focusColor,
                      filled: _decoration.filled,
                      fillColor: _decoration.fillColor) ??
                  _decoration,
              selectedItemBuilder: (context) => widget.values
                  .map((e) => widget.config.customItemWidget != null
                      ? widget.config.customItemWidget!(e)
                      : Text(
                          widget.config.customItemText != null
                              ? widget.config.customItemText!(e)
                              : e.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: widget.config.fyDropdownSetup.valueTextStyle
                              .copyWith(
                                  color: widget.config.isReadOnly ||
                                          widget.values.isEmpty
                                      ? widget.config.fyDropdownSetup
                                          .disabledTextColor
                                      : widget.config.fyDropdownSetup
                                          .valueTextStyle.color),
                        ))
                  .toList(),
              hint: Text(widget.config.hintText ?? '',
                  textAlign: TextAlign.left,
                  style: widget.config.fyDropdownSetup.valueTextStyle.copyWith(
                      color: widget.config.fyDropdownSetup.disabledTextColor)),
              icon: Icon(
                widget.config.fyDropdownSetup.dropDownIconConfigs.icon,
                color: widget.config.isReadOnly || widget.values.isEmpty
                    ? widget.config.fyDropdownSetup.dropDownIconConfigs
                        .disabledIconColor
                    : widget
                        .config.fyDropdownSetup.dropDownIconConfigs.iconColor,
              ),
              style: widget.config.fyDropdownSetup.valueTextStyle,
              dropdownColor: widget.config.fyDropdownSetup.dropdownColor,
              value: widget.config.initialValue,
              validator: _validator,
              isDense: true,
              isExpanded: true,
              menuMaxHeight: widget.config.menuMaxHeight,
              alignment: Alignment.centerLeft,
              items: widget.values
                  .map((e) => DropdownMenuItem<T>(
                        value: e,
                        child: widget.config.customItemWidget != null
                            ? widget.config.customItemWidget!(e)
                            : Text(
                                widget.config.customItemText != null
                                    ? widget.config.customItemText!(e)
                                    : e.toString(),
                                style: widget
                                    .config.fyDropdownSetup.valueTextStyle,
                              ),
                      ))
                  .toList(),
              onChanged: widget.config.isReadOnly
                  ? null
                  : (value) {
                      setState(() {
                        _selectedValue = value;
                      });

                      if (widget.config.onChanged != null) {
                        widget.config.onChanged!(value);
                      }
                    },
            ),
          )
        ],
      );
}
