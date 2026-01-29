import 'package:flutter/material.dart';

import '../../tokens/colors.dart';

/// Configuration for the transform animation behavior.
class TransformAnimation {
  const TransformAnimation({
    this.transitionStart = 0.3,
    this.transitionEnd = 0.8,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.slideDistance = 40.0,
  });

  /// The collapse ratio at which the transition starts (0.0 to 1.0).
  final double transitionStart;

  /// The collapse ratio at which the transition completes (0.0 to 1.0).
  final double transitionEnd;

  /// The duration of the animation.
  final Duration duration;

  /// The curve of the animation.
  final Curve curve;

  /// The distance widgets slide during transition (positive = pixels).
  final double slideDistance;
}

/// A builder function that creates the widget content.
typedef UIWidgetBuilder = Widget Function(BuildContext context);

/// A reusable SliverAppBar with smooth transform animations between two states.
///
/// **Animation Behavior**:
/// - **Expanded state**: Shows `expandedWidget`
/// - **When scrolling**:
///   - `expandedWidget` slides UP and fades out
///   - `collapsedWidget` slides DOWN from top and fades in
/// - **Collapsed state**: Shows `collapsedWidget`
///
/// **Perfect for**:
/// - Headers that transform into compact versions
/// - Profile headers that collapse to show name only
/// - Dashboard headers with different expanded/collapsed content
///
/// Example usage:
/// ```dart
/// UITransformingSliverAppBar(
///   scrollController: _scrollController,
///   expandedHeight: 200,
///   expandedWidget: (context) => BigHeader(),
///   collapsedWidget: (context) => CompactHeader(),
/// )
/// ```
class UITransformingSliverAppBar extends StatelessWidget {
  const UITransformingSliverAppBar({
    super.key,
    required this.scrollController,
    required this.expandedWidget,
    required this.collapsedWidget,
    this.backgroundColor = Colors.white,
    this.foregroundColor,
    this.expandedHeight = 200.0,
    this.collapsedHeight,
    this.toolbarHeight = 56.0,
    this.pinned = true,
    this.floating = true,
    this.snap = true,
    this.elevation = 0,
    this.leading,
    this.actions,
    this.bottom,
    this.transformAnimation = const TransformAnimation(),
    this.clipBehavior = Clip.none,
  });

  /// The scroll controller to track scroll position.
  final ScrollController scrollController;

  /// Builder for the widget shown when expanded.
  final UIWidgetBuilder expandedWidget;

  /// Builder for the widget shown when collapsed.
  final UIWidgetBuilder collapsedWidget;

  /// Background color of the app bar.
  final Color backgroundColor;

  /// Foreground color (text and icons).
  final Color? foregroundColor;

  /// Height when fully expanded.
  final double expandedHeight;

  /// Height when fully collapsed.
  final double? collapsedHeight;

  /// Height of the toolbar.
  final double toolbarHeight;

  /// Whether the app bar should remain visible.
  final bool pinned;

  /// Whether the app bar should float.
  final bool floating;

  /// Whether the app bar should snap.
  final bool snap;

  /// The elevation of the app bar.
  final double elevation;

  /// Widget to display before the title area.
  final Widget? leading;

  /// Widgets to display after the title area.
  final List<Widget>? actions;

  /// Widget to display at the bottom.
  final PreferredSizeWidget? bottom;

  /// Configuration for the transform animation.
  final TransformAnimation transformAnimation;

  /// The clip behavior.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor ?? UIColor.textPrimary,
      elevation: elevation,
      clipBehavior: clipBehavior,
      floating: floating,
      snap: snap,
      pinned: pinned,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      toolbarHeight: toolbarHeight,
      leading: leading,
      actions: actions,
      bottom: bottom,
      flexibleSpace: AnimatedBuilder(
        animation: scrollController,
        builder: (context, child) {
          // Calculate collapse ratio (0 = expanded, 1 = collapsed)
          final scrollOffset =
              scrollController.hasClients ? scrollController.offset : 0.0;
          final maxScroll = expandedHeight - toolbarHeight;
          final collapseRatio = (scrollOffset / maxScroll).clamp(0.0, 1.0);

          return Stack(
            fit: StackFit.expand,
            children: [
              // ✅ Expanded widget - slides UP and fades out
              _buildExpandedWidget(context, collapseRatio),

              // ✅ Collapsed widget - slides DOWN and fades in
              _buildCollapsedWidget(context, collapseRatio),
            ],
          );
        },
      ),
    );
  }

  /// Builds the expanded widget with slide-up animation.
  Widget _buildExpandedWidget(BuildContext context, double collapseRatio) {
    // Calculate transition progress (0.0 to 1.0)
    final transitionRange =
        transformAnimation.transitionEnd - transformAnimation.transitionStart;
    final transitionProgress =
        collapseRatio < transformAnimation.transitionStart
            ? 0.0
            : ((collapseRatio - transformAnimation.transitionStart) /
                    transitionRange)
                .clamp(0.0, 1.0);

    // Opacity: visible → invisible
    final opacity = 1.0 - transitionProgress;

    // Slide: 0 → UP (negative offset)
    final slideOffset = -transitionProgress * transformAnimation.slideDistance;

    return IgnorePointer(
      ignoring: opacity < 0.1,
      child: AnimatedOpacity(
        duration: transformAnimation.duration,
        curve: transformAnimation.curve,
        opacity: 1,
        child: Transform.translate(
          offset: Offset(0, slideOffset),
          child: SafeArea(child: expandedWidget(context)),
        ),
      ),
    );
  }

  /// Builds the collapsed widget with slide-down animation.
  Widget _buildCollapsedWidget(BuildContext context, double collapseRatio) {
    // Calculate transition progress (0.0 to 1.0)
    final transitionRange =
        transformAnimation.transitionEnd - transformAnimation.transitionStart;
    final transitionProgress =
        collapseRatio < transformAnimation.transitionStart
            ? 0.0
            : ((collapseRatio - transformAnimation.transitionStart) /
                    transitionRange)
                .clamp(0.0, 1.0);

    // Opacity: invisible → visible
    final opacity = transitionProgress;

    // Slide: UP (negative) → 0
    final slideOffset =
        -(1.0 - transitionProgress) * transformAnimation.slideDistance;

    return IgnorePointer(
      ignoring: opacity < 0.5,
      child: AnimatedOpacity(
        duration: transformAnimation.duration,
        curve: transformAnimation.curve,
        opacity: 1,
        child: Transform.translate(
          offset: Offset(0, slideOffset),
          child: SafeArea(
            child: Container(
              height: toolbarHeight,
              alignment: Alignment.centerLeft,
              color: backgroundColor,
              child: collapsedWidget(context),
            ),
          ),
        ),
      ),
    );
  }
}
