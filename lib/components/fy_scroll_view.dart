library;

import 'package:flutter/material.dart';
import 'package:flutter_fy/utils/fy_platform.dart';

class FyScrollView extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onForceScrollToTop;
  final VoidCallback? loadMoreFunction;
  final ({bool loading, bool hasMore})? loadMore;
  final ScrollController? scrollController;
  final bool reverse;

  const FyScrollView({
    super.key,
    required this.child,
    this.padding,
    this.onForceScrollToTop,
    this.loadMoreFunction,
    this.loadMore,
    this.scrollController,
    this.reverse = false,
  });

  @override
  State<FyScrollView> createState() => FyScrollViewState();
}

class FyScrollViewState extends State<FyScrollView> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.scrollController ?? ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_scrollListener);
    if (widget.scrollController == null) _controller.dispose();
  }

  Future<void> _scrollListener() async {
    final position = _controller.position;

    if (position.pixels >= -2 && position.pixels <= -1) {
      widget.onForceScrollToTop?.call();
    }

    if (widget.loadMoreFunction != null &&
        position.maxScrollExtent - position.pixels <= 100 &&
        !(widget.loadMore?.loading ?? true) &&
        (widget.loadMore?.hasMore ?? false)) {
      widget.loadMoreFunction!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FyPlatform.isMobile
        ? _buildScroll()
        : Scrollbar(
            controller: _controller,
            interactive: false,
            thumbVisibility: true,
            child: _buildScroll(),
          );
  }

  Widget _buildScroll() {
    return SingleChildScrollView(
      controller: _controller,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: widget.padding,
      reverse: widget.reverse,
      child: widget.child,
    );
  }
}
