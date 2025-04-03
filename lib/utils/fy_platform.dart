library;

import 'package:flutter/foundation.dart';

class FyPlatform {
  FyPlatform._();

  static bool get isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isMacOS =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;
  static bool get isLinux =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.linux;
  static bool get isWindows =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;

  static bool get isDesktop => !kIsWeb && (isLinux || isMacOS || isWindows);
  static bool get isMobile => !kIsWeb && (isAndroid || isIOS);
  static bool get isWeb => kIsWeb;
}
