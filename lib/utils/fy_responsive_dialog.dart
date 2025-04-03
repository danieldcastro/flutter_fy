import 'package:flutter/material.dart';
import 'package:flutter_fy/utils/fy_sizes.dart';

Future<T?> showResponsiveDialog<T>(
  BuildContext context, {
  required Color backgroundColor,
  required Widget child,
  final bool fullSmallScreenDialog = false,
  final bool barrierDismissible = true,
}) async {
  return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => PopScope(
            canPop: barrierDismissible,
            child: _ResponsiveDialog(
              backgroundColor: backgroundColor,
              fullSmallScreenDialog: fullSmallScreenDialog,
              child: child,
            ),
          ));
}

class _ResponsiveDialog extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final bool fullSmallScreenDialog;

  const _ResponsiveDialog({
    required this.backgroundColor,
    required this.child,
    required this.fullSmallScreenDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      insetPadding: (FySizes.isLargeScreen(context)
          ? EdgeInsets.symmetric(
              horizontal: FySizes.width(context) * 0.20, vertical: 64)
          : fullSmallScreenDialog
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(horizontal: 30.0, vertical: 24.0)),
      shape: !FySizes.isLargeScreen(context) && fullSmallScreenDialog
          ? const Border()
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
