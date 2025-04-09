import 'package:flutter/material.dart';

class FyToggleSlider extends StatelessWidget {
  final ValueChanged<bool>? onChanged;
  final Widget leftWidget;
  final Widget rightWidget;
  final bool value;
  final double height;
  final BorderRadius? backgroundBorderRadius;
  final BoxBorder? backgroundBorder;
  final BorderRadius? foregroundBorderRadius;
  final BoxBorder? foregroundBorder;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledColor;

  const FyToggleSlider({
    super.key,
    required this.onChanged,
    required this.value,
    required this.leftWidget,
    required this.rightWidget,
    this.height = 40,
    this.backgroundBorderRadius,
    this.backgroundBorder,
    this.foregroundBorderRadius,
    this.foregroundBorder,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.blueAccent,
    this.disabledColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onChanged == null ? null : () => onChanged!(!value),
        onHorizontalDragUpdate: onChanged == null
            ? null
            : (details) {
                if (details.delta.dx > 4) {
                  onChanged!(!value);
                  return;
                }
                if (details.localPosition.dx < 0) {
                  onChanged!(!value);
                  return;
                }
              },
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: backgroundBorderRadius,
            border: backgroundBorder,
            color: backgroundColor,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 375),
                curve: Curves.ease,
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth / 2,
                    decoration: BoxDecoration(
                      borderRadius: foregroundBorderRadius,
                      border: foregroundBorder,
                      color:
                          onChanged == null ? disabledColor : foregroundColor,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  _buildOption(leftWidget, !value, true),
                  _buildOption(rightWidget, value, false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(Widget child, bool isSelected, bool isLeft) {
    return Expanded(
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 375),
        curve: Curves.ease,
        alignment: isSelected
            ? Alignment.center
            : isLeft
                ? Alignment.centerLeft
                : Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FittedBox(fit: BoxFit.scaleDown, child: child),
        ),
      ),
    );
  }
}
