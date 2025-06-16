import 'package:flutter/material.dart';
import 'config/fy_side_sheet_config.dart';

class FySideSheet {
  /// Private method to open the side sheet based on the provided configuration.
  static Future<T?> _open<T>({
    required Widget body,
    required BuildContext context,
    required FySideSheetConfig config,
    required bool rightSide,
  }) async {
    final dynamic data = await _showSheetSide(
      body: body,
      config: config,
      rightSide: rightSide,
      context: context,
    );
    return data ?? '';
  }

  /// Opens the side sheet on the left side.
  ///
  /// Example usage:
  /// ```dart
  /// onPressed: () => SideSheet.left(
  ///   body: Text("Content"),
  ///   context: context,
  ///   config: FySideSheetConfig(),
  /// )
  /// ```
  static Future<T?> left<T>({
    required Widget body,
    required BuildContext context,
    FySideSheetConfig config = const FySideSheetConfig(),
  }) async => _open(
      body: body,
      context: context,
      config: config,
      rightSide: false,
    );

  /// Opens the side sheet on the right side.
  ///
  /// Example usage:
  /// ```dart
  /// onPressed: () => SideSheet.right(
  ///   body: Text("Content"),
  ///   context: context,
  ///   config: FySideSheetConfig(),
  /// )
  /// ```
  static Future<T?> right<T>({
    required Widget body,
    required BuildContext context,
    FySideSheetConfig config = const FySideSheetConfig(),
  }) async => _open(
      body: body,
      context: context,
      config: config,
      rightSide: true,
    );

  /// Internal method that displays the side sheet based on the provided configuration.
  static Future<T?> _showSheetSide<T>({
    required Widget body,
    required FySideSheetConfig config,
    required bool rightSide,
    required BuildContext context,
  }) {
    // Define the border radius to round only the corresponding side.
    final BorderRadius borderRadius = BorderRadius.only(
      topLeft:
          rightSide ? Radius.circular(config.sheetBorderRadius) : Radius.zero,
      bottomLeft:
          rightSide ? Radius.circular(config.sheetBorderRadius) : Radius.zero,
      topRight:
          !rightSide ? Radius.circular(config.sheetBorderRadius) : Radius.zero,
      bottomRight:
          !rightSide ? Radius.circular(config.sheetBorderRadius) : Radius.zero,
    );

    return showGeneralDialog(
      barrierLabel: config.barrierLabel,
      barrierDismissible: config.barrierDismissible,
      barrierColor: config.barrierColor,
      transitionDuration: config.transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) => Align(
          alignment: rightSide ? Alignment.centerRight : Alignment.centerLeft,
          child: Material(
            elevation: 15,
            color: Colors.transparent,
            borderRadius: borderRadius,
            child: Container(
              decoration: BoxDecoration(
                color: config.sheetColor,
                borderRadius: borderRadius,
              ),
              height: double.infinity,
              width: config.width ?? MediaQuery.of(context).size.width / 1.4,
              child: body,
            ),
          ),
        ),
      transitionBuilder: (context, animation1, animation2, child) => SlideTransition(
          position: Tween(
            begin: Offset(rightSide ? 1 : -1, 0),
            end: Offset.zero,
          ).animate(animation1),
          child: child,
        ),
    );
  }
}
