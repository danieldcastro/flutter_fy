import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fy/components/loadings/loading_rotating_dots/fy_loading_rotating_dots.dart';
import 'package:flutter_fy/utils/fy_responsive_modals.dart';
import 'package:flutter_fy/utils/validation/fy_validations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/extensions/string_extensions/string_extensions.dart';
import '../../../../utils/result/result.dart';
import '../../../fy_scroll_view/fy_scroll_view.dart';
import '../text_form_field_config/text_form_field_config.dart';
import '../text_form_field_setup/text_form_field_setup.dart';

///Não instancie diretamente TextFormFieldBase. Use algum dos BelFields ou crie um novo.
class TextFormFieldBase extends StatefulWidget {
  final TextFormFieldConfig config;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final double suffixIconMaxWidth;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Future<DateTime?> Function(BuildContext context)? onTap;

  ///* Lista de validators (isNotEmpty() não precisa ser adicionado)
  final ValidatorsCallBack? validators;

  ///```dart
  ///textCapitalization = TextCapitalization.none
  ///```
  final TextCapitalization textCapitalization;

  ///```dart
  ///maxLines = 1
  ///```
  final int? maxLines;

  ///```dart
  ///obscureText = false
  ///```
  final bool obscureText;

  const TextFormFieldBase(
    this.config, {
    super.key,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.validators,
    this.inputFormatters,
    required this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.suffixIcon,
    this.suffixIconMaxWidth = 60,
    this.prefixIcon,
    this.prefix,
    this.onTap,
  });

  @override
  State<TextFormFieldBase> createState() => _TextFormFieldBaseState();
}

class _TextFormFieldBaseState extends State<TextFormFieldBase> {
  String? _errorText;
  late FocusNode _focusNode;
  String? _text;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode()..addListener(_handleFocusChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.config.needsFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  void _handleFocusChange() {
    if (widget.config.onFocusChanged != null) {
      widget.config.onFocusChanged!(_focusNode.hasFocus);
    }
    if (!_focusNode.hasFocus) {
      String? validationResult = _validator(_text, requestFocus: false);
      setState(() {
        _errorText = validationResult;
      });
    } else {
      setState(() {
        _errorText = null;
      });
    }
  }

  String? _validator(String? value, {bool requestFocus = true}) {
    if (!widget.config.isRequired &&
        widget.config.initialValue.isNullOrEmpty &&
        (widget.config.controller?.text.isNullOrEmpty ?? true) &&
        value.isNullOrEmpty) {
      return null;
    } else {
      String? validation = FyValidations.multiple([
        if (widget.config.isRequired)
          () => FyValidations.isRequired(
              value ??
                  widget.config.initialValue ??
                  widget.config.controller?.text,
              widget
                  .config.textFormFieldSetup.validationMessages.requiredField),
        if (widget.validators != null)
          ...widget.validators!(value ??
              widget.config.initialValue ??
              widget.config.controller?.text)
      ]);

      if (validation.isNullOrEmpty) {
        return null;
      } else {
        if (widget.config.textFormFieldSetup.onValidationError != null &&
            requestFocus) {
          _focusNode.requestFocus();
          widget.config.textFormFieldSetup.onValidationError!(validation ?? '');
        }
        return validation;
      }
    }
  }

  Widget _switchHelpTextIcon(Result<String, IconData>? icon) {
    return icon?.fold(
            (string) => switch (string.isSVG) {
                  true => SvgPicture.asset(string,
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                          widget.config.textFormFieldSetup.helpTextSetup
                                  ?.iconColor ??
                              Colors.black,
                          BlendMode.srcIn)),
                  false => Image.asset(string,
                      height: 24,
                      width: 24,
                      color: widget.config.textFormFieldSetup.helpTextSetup
                              ?.iconColor ??
                          Colors.black),
                },
            (iconData) => Icon(
                  iconData,
                  size: 24,
                  color: widget
                          .config.textFormFieldSetup.helpTextSetup?.iconColor ??
                      Colors.black,
                )) ??
        const SizedBox.shrink();
  }

  void _showHelpText() {
    final helpTextSetup = widget.config.textFormFieldSetup.helpTextSetup;
    final helpTextConfigs = widget.config.helpTextConfigs;
    showResponsiveDialog(
      context,
      backgroundColor:
          (helpTextConfigs?.titleStyle.color?.computeLuminance() ?? 0) > 0.5
              ? Colors.black
              : Colors.white,
      child: FyScrollView(
        padding: const EdgeInsets.all(45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _switchHelpTextIcon(helpTextSetup?.icon),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.config.helpTextConfigs!.title,
                    style: helpTextConfigs?.titleStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.config.helpTextConfigs!.description,
              style: helpTextConfigs?.descriptionStyle,
            )
          ],
        ),
      ),
    );
  }

  TextFormField _textFormField() => TextFormField(
      controller: widget.config.controller,
      focusNode: _focusNode,
      textInputAction: widget.config.textInputAction,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.maxLines,
      onChanged: (value) {
        setState(() {
          _text = value;
        });
        if (widget.config.onChanged != null) {
          widget.config.onChanged!(value);
        }
      },
      onEditingComplete: widget.config.onEditingComplete,
      onSaved: widget.config.onSaved,
      onFieldSubmitted: widget.config.onFieldSubmitted,
      obscureText: widget.obscureText || widget.config.obscureText,
      obscuringCharacter: widget.config.obscuringCharacter,
      style: widget.config.textFormFieldSetup.cursorTextStyle.copyWith(
          color: widget.config.isReadOnly
              ? widget.config.textFormFieldSetup.readOnlyTextColor
              : null),
      buildCounter: (_,
              {required currentLength, required isFocused, maxLength}) =>
          const SizedBox.shrink(),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength ?? 255,
      enabled: widget.config.isEnabled ?? !widget.config.isReadOnly,
      readOnly: widget.config.isReadOnly,
      validator: _validator,
      initialValue: widget.config.controller == null
          ? widget.config.initialValue ?? ''
          : null,
      cursorColor: widget.onTap == null ? null : Colors.transparent,
      cursorErrorColor: widget.onTap == null ? null : Colors.transparent,
      decoration: InputDecoration(
          suffixIconConstraints:
              BoxConstraints(maxWidth: widget.suffixIconMaxWidth),
          errorText: _errorText,
          hintText: widget.config.hintText,
          filled: widget.config.isReadOnly ||
              widget.config.textFormFieldSetup.filled,
          fillColor: widget.config.isReadOnly
              ? widget.config.textFormFieldSetup.readOnlyFillColor
              : widget.config.textFormFieldSetup.enabledFillColor,
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon,
          suffixIcon: (widget.config.isLoading ?? false)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: FyLoadingRotatingDots(
                      color: widget.config.textFormFieldSetup.cursorTextStyle
                              .color ??
                          Colors.black,
                      size: 25),
                )
              : SizedBox.shrink()));

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    widget.config.controller?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextFormFieldSetup(:titleStyle, :helpTextSetup) =
        widget.config.textFormFieldSetup;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.config.title != null)
              Flexible(
                child: FittedBox(
                  child: SelectionArea(
                    child: Text(
                        widget.config.isRequired
                            ? (widget.config.title ?? '').addAsteriskPrefix
                            : (widget.config.title ?? ''),
                        style: titleStyle),
                  ),
                ),
              ),
            if (widget.config.helpTextConfigs != null)
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                highlightColor: Colors.transparent,
                onTap: _showHelpText,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: _switchHelpTextIcon(helpTextSetup?.icon),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: !widget.config.isReadOnly && widget.onTap != null
              ? () {
                  _focusNode.requestFocus();
                  setState(() {
                    widget.onTap!(context);
                  });
                }
              : null,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          highlightColor: Colors.transparent,
          child: IgnorePointer(
              ignoring: widget.onTap != null, child: _textFormField()),
        ),
      ],
    );
  }
}
