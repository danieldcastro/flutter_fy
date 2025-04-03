library;

import 'package:flutter/material.dart';

class FySizes {
  FySizes._();

  static double get largeScreen => 1100;

  static double get mediumScreen => 600;

  static double get smallScreen => 400;

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;

  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double get widthNoContext =>
      WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  static double get heightNoContext =>
      WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.height /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  static double toolbarHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= largeScreen ? kToolbarHeight : 86;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreen;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreen &&
      MediaQuery.of(context).size.width < largeScreen;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreen;
}
