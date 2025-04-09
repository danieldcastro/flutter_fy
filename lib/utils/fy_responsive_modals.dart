import 'package:flutter/material.dart';
import 'package:flutter_fy/components/fy_scroll_view/fy_scroll_view.dart';
import 'package:flutter_fy/components/modals/side_sheet/config/fy_side_sheet_config.dart';
import 'package:flutter_fy/components/modals/side_sheet/fy_side_sheet.dart';
import 'package:flutter_fy/utils/fy_sizes.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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

Future<T?> showResponsiveBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  Color? backgroundColor,
  bool showCloseButton = true,
  bool isBarrierDismissible = true,
  PortraitSheetArgs? portraitArgs,
  LandscapeSheetArgs? landscapeArgs,
}) {
  final color = backgroundColor ?? Colors.white;
  final localPortraitArgs = portraitArgs ?? PortraitSheetArgs();
  final localLandscapeArgs = landscapeArgs ?? LandscapeSheetArgs();
  final bottomSheetHeight =
      (localPortraitArgs.height ?? (FySizes.height(context) * 0.75)) /
          FySizes.height(context);
  final sideSheetWidth = localLandscapeArgs.width ?? FySizes.width(context) / 3;

  if (!FySizes.isLargeScreen(context)) {
    return _showMobileBottomSheet(
      context,
      child,
      color,
      showCloseButton,
      isBarrierDismissible,
      bottomSheetHeight,
      localPortraitArgs.isDraggable,
    );
  } else {
    return _showSideSheet(
      context,
      child,
      color,
      showCloseButton,
      isBarrierDismissible,
      sideSheetWidth,
    );
  }
}

Future<T?> _showMobileBottomSheet<T>(
  BuildContext context,
  Widget child,
  Color color,
  bool showCloseButton,
  bool barrierDismissible,
  double bottomHeight,
  bool isDraggable,
) {
  return showModalBottomSheet(
    isDismissible: barrierDismissible,
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: isDraggable,
    builder: (_) {
      return TapRegion(
        onTapOutside: (_) {
          if (barrierDismissible) Navigator.pop(context);
        },
        child: DraggableScrollableSheet(
          shouldCloseOnMinExtent: true,
          minChildSize: 0,
          initialChildSize: isDraggable ? bottomHeight : 1,
          snap: isDraggable,
          snapSizes: const [0.75, 1.0],
          builder: (ctx, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: FyScrollView(
                padding: EdgeInsets.zero,
                scrollController: scrollController,
                child: Column(
                  children: [
                    if (showCloseButton)
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(LucideIcons.chevronDown),
                          ),
                        ),
                      ),
                    child,
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

Future<T?> _showSideSheet<T>(
  BuildContext context,
  Widget child,
  Color color,
  bool showCloseButton,
  bool barrierDismissible,
  double? width,
) {
  return FySideSheet.right(
    config: FySideSheetConfig(
      sheetBorderRadius: 10,
      barrierDismissible: barrierDismissible,
      sheetColor: color,
      width: width,
    ),
    body: FyScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          if (showCloseButton)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Theme(data: ThemeData(), child: CloseButton()),
              ),
            ),
          child,
        ],
      ),
    ),
    context: context,
  );
}

class PortraitSheetArgs {
  final double? height;
  final bool isDraggable;
  PortraitSheetArgs({this.height, this.isDraggable = true});
}

class LandscapeSheetArgs {
  final double? width;
  LandscapeSheetArgs({this.width});
}
