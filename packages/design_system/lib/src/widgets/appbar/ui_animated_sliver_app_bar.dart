import 'package:flutter/material.dart';

import '../../tokens/colors.dart';

/// Configuration for the collapsed title animation behavior.
class CollapsedTitleAnimation {
  const CollapsedTitleAnimation({
    this.fadeInStart = 0.7,
    this.fadeInEnd = 0.95,
    this.slideDistance = -20.0,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOut,
  });

  /// The collapse ratio at which the collapsed title starts fading in (0.0 to 1.0).
  final double fadeInStart;

  /// The collapse ratio at which the collapsed title is fully visible (0.0 to 1.0).
  final double fadeInEnd;

  /// The vertical distance the collapsed title slides from (negative = slide from top).
  final double slideDistance;

  /// The duration of the animation.
  final Duration duration;

  /// The curve of the animation.
  final Curve curve;
}

/// A builder function that receives the collapse ratio and builds the collapsed title.
///
/// The [collapseRatio] ranges from 0.0 (fully expanded) to 1.0 (fully collapsed).
typedef CollapsedTitleBuilder =
    Widget Function(BuildContext context, double collapseRatio);

/// A builder function that receives the collapse ratio and builds the expanded content.
///
/// The [collapseRatio] ranges from 0.0 (fully expanded) to 1.0 (fully collapsed).
typedef ExpandedContentBuilder =
    Widget Function(BuildContext context, double collapseRatio);

/// A reusable animated SliverAppBar with smooth collapse/expand behavior.
///
/// Features:
/// - Animated collapsed title that fades in and slides when scrolling
/// - Flexible expanded content area
/// - Configurable animation behavior
/// - Support for pinned, floating, and snap behaviors
/// - Customizable colors and dimensions
///
/// Example usage:
/// ```dart
/// UIAnimatedSliverAppBar(
///   scrollController: _scrollController,
///   expandedHeight: 200,
///   collapsedTitleBuilder: (context, ratio) => Text('Collapsed Title'),
///   expandedContentBuilder: (context, ratio) => YourExpandedContent(),
/// )
/// ```
class UIAnimatedSliverAppBar extends StatelessWidget {
  const UIAnimatedSliverAppBar({
    super.key,
    required this.scrollController,
    required this.collapsedTitleBuilder,
    required this.expandedContentBuilder,
    this.backgroundColor = Colors.white,
    this.foregroundColor,
    this.expandedHeight = 200.0,
    this.collapsedHeight,
    this.toolbarHeight = 56.0,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.elevation = 0,
    this.leading,
    this.actions,
    this.bottom,
    this.centerTitle = false,
    this.collapsedTitleAnimation = const CollapsedTitleAnimation(),
    this.clipBehavior = Clip.none,
  });

  /// The scroll controller to track scroll position.
  final ScrollController scrollController;

  /// Builder for the collapsed title that appears when scrolling.
  final CollapsedTitleBuilder collapsedTitleBuilder;

  /// Builder for the expanded content in the FlexibleSpaceBar.
  final ExpandedContentBuilder expandedContentBuilder;

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

  /// Whether the app bar should remain visible at the start of the scroll view.
  final bool pinned;

  /// Whether the app bar should become visible as soon as scrolling towards it.
  final bool floating;

  /// Whether the app bar should snap into view.
  final bool snap;

  /// The elevation of the app bar.
  final double elevation;

  /// Widget to display before the title.
  final Widget? leading;

  /// Widgets to display after the title.
  final List<Widget>? actions;

  /// Widget to display at the bottom of the app bar.
  final PreferredSizeWidget? bottom;

  /// Whether the collapsed title should be centered.
  final bool centerTitle;

  /// Configuration for the collapsed title animation.
  final CollapsedTitleAnimation collapsedTitleAnimation;

  /// The clip behavior of the app bar.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    // Calculate the effective height for collapse ratio calculation
    final effectiveExpandedHeight = expandedHeight - toolbarHeight;

    return SliverAppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor ?? UIColor.textPrimary,
      elevation: elevation,
      clipBehavior: clipBehavior,
      floating: floating,
      snap: snap,
      pinned: pinned,
      centerTitle: centerTitle,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      toolbarHeight: toolbarHeight,
      leading: leading,
      actions: actions,
      bottom: bottom,
      title: AnimatedBuilder(
        animation: scrollController,
        builder: (context, child) {
          final scrollOffset =
              scrollController.hasClients ? scrollController.offset : 0.0;
          final collapseRatio = (scrollOffset / expandedHeight).clamp(0.0, 1.0);
          final opacity = ((collapseRatio - 0.7) / 0.25).clamp(0.0, 1.0);

          // Slide from top: -20px to 0px
          final slideOffset = (1.0 - opacity) * -20.0;
          return IgnorePointer(
            ignoring: opacity < 0.5, // Disable interaction when barely visible
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(0, slideOffset),
                child: _buildAnimatedCollapsedTitle(context, collapseRatio),
              ),
            ),
          );
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(child: expandedContentBuilder(context, 1)),
      ),
    );
  }

  /// Builds the animated collapsed title with fade and slide effects.
  Widget _buildAnimatedCollapsedTitle(
    BuildContext context,
    double collapseRatio,
  ) {
    // Calculate opacity based on animation config
    final fadeRange =
        collapsedTitleAnimation.fadeInEnd - collapsedTitleAnimation.fadeInStart;
    final opacity =
        collapseRatio < collapsedTitleAnimation.fadeInStart
            ? 0.0
            : ((collapseRatio - collapsedTitleAnimation.fadeInStart) /
                    fadeRange)
                .clamp(0.0, 1.0);

    // Calculate slide offset
    final slideOffset = (1.0 - opacity) * collapsedTitleAnimation.slideDistance;

    return IgnorePointer(
      ignoring: opacity < 0.5, // Disable interaction when barely visible
      child: AnimatedOpacity(
        duration: collapsedTitleAnimation.duration,
        curve: collapsedTitleAnimation.curve,
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(0, slideOffset),
          child: collapsedTitleBuilder(context, collapseRatio),
        ),
      ),
    );
  }
}

/// A simpler version without builders for common use cases.
class UIAnimatedSliverAppBarSimple extends StatelessWidget {
  const UIAnimatedSliverAppBarSimple({
    super.key,
    required this.scrollController,
    required this.collapsedTitle,
    required this.expandedContent,
    this.backgroundColor = Colors.white,
    this.foregroundColor,
    this.expandedHeight = 200.0,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.elevation = 0,
    this.leading,
    this.actions,
    this.bottom,
  });

  final ScrollController scrollController;
  final Widget collapsedTitle;
  final Widget expandedContent;
  final Color backgroundColor;
  final Color? foregroundColor;
  final double expandedHeight;
  final bool pinned;
  final bool floating;
  final bool snap;
  final double elevation;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return UIAnimatedSliverAppBar(
      scrollController: scrollController,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      expandedHeight: expandedHeight,
      pinned: pinned,
      floating: floating,
      snap: snap,
      elevation: elevation,
      leading: leading,
      actions: actions,
      bottom: bottom,
      collapsedTitleBuilder: (context, ratio) => collapsedTitle,
      expandedContentBuilder: (context, ratio) => expandedContent,
    );
  }
}
