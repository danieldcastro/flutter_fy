import 'package:flutter/material.dart';

class FySideSheetConfig {
  final String barrierLabel;
  final bool barrierDismissible;
  final Color barrierColor;
  final double sheetBorderRadius;
  final Color sheetColor;
  final Duration transitionDuration;
  final double? width;

  const FySideSheetConfig({
    this.barrierLabel = "Side Sheet",
    this.barrierDismissible = true,
    this.barrierColor = const Color(0xff66000000),
    this.sheetBorderRadius = 0,
    this.sheetColor = Colors.white,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.width,
  });
}
