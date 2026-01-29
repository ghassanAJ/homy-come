import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../tokens/colors.dart';
import '../../ui.dart';
import 'ui_app_bar_actions.dart';

/// Defines the visual style variants for [UISliverAppBar].
enum UISliverAppBarVariant {
  /// Standard AppBar with surface background and dark text.
  standard,

  /// Transparent AppBar with dark text.
  transparent,

  /// Primary colored AppBar with white text.
  primary,
}

/// Internal configuration class that defines the colors for each AppBar variant.
class _SliverAppBarStyleConfig {
  const _SliverAppBarStyleConfig({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;

  static const standard = _SliverAppBarStyleConfig(
    backgroundColor: UIColor.surface,
    foregroundColor: UIColor.textPrimary,
  );

  static const transparent = _SliverAppBarStyleConfig(
    backgroundColor: Colors.transparent,
    foregroundColor: UIColor.textPrimary,
  );

  static const primary = _SliverAppBarStyleConfig(
    backgroundColor: UIColor.primary,
    foregroundColor: UIColor.onPrimary,
  );

  /// Returns the style configuration for the given variant.
  static _SliverAppBarStyleConfig fromVariant(UISliverAppBarVariant variant) {
    switch (variant) {
      case UISliverAppBarVariant.standard:
        return standard;
      case UISliverAppBarVariant.transparent:
        return transparent;
      case UISliverAppBarVariant.primary:
        return primary;
    }
  }
}

/// A customizable SliverAppBar widget that follows the design system.
///
/// Supports various configurations including:
/// - Pinned, floating, and snap behaviors
/// - Centered or left-aligned titles
/// - Leading actions (back button, close button, custom widgets)
/// - Trailing actions (text buttons, icon buttons, custom widgets)
/// - Configurable background colors
/// - Expandable/collapsible with FlexibleSpaceBar
///
/// Example usage:
/// ```dart
/// final actionsFactory = DefaultUIAppBarActions();
/// UISliverAppBar(
///   title: 'My Screen',
///   centerTitle: true,
///   pinned: true,
///   floating: true,
///   leading: actionsFactory.backButton(context),
///   actions: [
///     actionsFactory.textAction('Add', onPressed: () {}),
///   ],
/// )
/// ```
class UISliverAppBar extends StatelessWidget {
  /// Creates a customizable SliverAppBar.
  const UISliverAppBar({
    super.key,
    this.variant = UISliverAppBarVariant.standard,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = false,
    this.elevation = 0,
    this.expandedHeight,
    this.collapsedHeight,
    this.flexibleSpace,
    this.bottom,
    this.pinned = false,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.toolbarHeight = 56.0,
    this.leadingWidth,
    this.automaticallyImplyLeading = true,
    this.actionsFactory = const DefaultUIAppBarActions(),
  }) : assert(
         title != null || titleWidget != null || flexibleSpace != null,
         'Either title, titleWidget, or flexibleSpace must be provided',
       );

  /// The visual style variant of the AppBar.
  final UISliverAppBarVariant variant;

  /// The title text to display in the AppBar.
  final String? title;

  /// A custom widget to display as the title instead of [title].
  final Widget? titleWidget;

  /// A widget to display before the title (typically a back button).
  final Widget? leading;

  /// Widgets to display after the title (typically action buttons).
  final List<Widget>? actions;

  /// The background color of the AppBar.
  final Color? backgroundColor;

  /// The color of the title and icons.
  final Color? foregroundColor;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// The elevation of the AppBar.
  final double elevation;

  /// The size of the app bar when it is fully expanded.
  final double? expandedHeight;

  /// The size of the app bar when it is fully collapsed.
  final double? collapsedHeight;

  /// The widget to display in the flexible space.
  final Widget? flexibleSpace;

  /// A widget to display at the bottom of the app bar.
  final PreferredSizeWidget? bottom;

  /// Whether the app bar should remain visible at the start of the scroll view.
  final bool pinned;

  /// Whether the app bar should become visible as soon as the user scrolls towards the app bar.
  final bool floating;

  /// Whether the app bar should snap into view.
  final bool snap;

  /// Whether the app bar should stretch to fill the over-scroll area.
  final bool stretch;

  /// The height of the toolbar.
  final double toolbarHeight;

  /// The width of the leading widget.
  final double? leadingWidth;

  /// Whether to automatically add a back button if [leading] is null.
  final bool automaticallyImplyLeading;

  /// Factory for creating AppBar action buttons.
  final UIAppBarActionsInterface actionsFactory;

  @override
  Widget build(BuildContext context) {
    // Get the style configuration for the variant
    final styleConfig = _SliverAppBarStyleConfig.fromVariant(variant);
    final effectiveBackgroundColor =
        backgroundColor ?? styleConfig.backgroundColor;
    final effectiveForegroundColor =
        foregroundColor ?? styleConfig.foregroundColor;

    // Build the title widget
    final Widget? effectiveTitle = _buildTitle(effectiveForegroundColor);

    return SliverAppBar(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      pinned: pinned,
      floating: floating,
      snap: snap,
      stretch: stretch,
      automaticallyImplyLeading: false, // We handle this manually
      leading: _buildLeading(context, effectiveForegroundColor),
      title: effectiveTitle,
      actions: _buildActions(),
      flexibleSpace: flexibleSpace,
      bottom: bottom,
    );
  }

  /// Builds the title widget.
  Widget? _buildTitle(Color foregroundColor) {
    if (titleWidget != null) return titleWidget;
    if (title == null) return null;

    return Text(
      title!,
      style: UI.text.h3.copyWith(color: foregroundColor),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Builds the leading widget with automatic back button handling.
  Widget? _buildLeading(BuildContext context, Color foregroundColor) {
    final bool canPop =
        Navigator.of(context).canPop() || GoRouter.of(context).canPop();

    return leading ??
        (automaticallyImplyLeading && canPop
            ? actionsFactory.backButton(
              context,
              color: foregroundColor,
              onPressed: () {
                context.pop();
              },
            )
            : null);
  }

  /// Builds the trailing actions list.
  List<Widget>? _buildActions() {
    if (actions == null || actions!.isEmpty) return null;
    return actions;
  }
}
