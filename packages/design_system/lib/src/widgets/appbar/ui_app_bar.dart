import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../tokens/colors.dart';
import '../../ui.dart';
import 'ui_app_bar_actions.dart';

/// Defines the visual style variants for [UIAppBar].
enum UIAppBarVariant {
  /// Standard AppBar with surface background and dark text.
  standard,

  /// Transparent AppBar with dark text.
  transparent,

  /// Primary colored AppBar with white text.
  primary,
}

/// Internal configuration class that defines the colors for each AppBar variant.
class _AppBarStyleConfig {
  const _AppBarStyleConfig({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;

  static const standard = _AppBarStyleConfig(
    backgroundColor: Colors.transparent,
    foregroundColor: UIColor.textPrimary,
  );

  static const transparent = _AppBarStyleConfig(
    backgroundColor: Colors.transparent,
    foregroundColor: UIColor.textPrimary,
  );

  static const primary = _AppBarStyleConfig(
    backgroundColor: UIColor.primary,
    foregroundColor: UIColor.onPrimary,
  );

  /// Returns the style configuration for the given variant.
  static _AppBarStyleConfig fromVariant(UIAppBarVariant variant) {
    switch (variant) {
      case UIAppBarVariant.standard:
        return standard;
      case UIAppBarVariant.transparent:
        return transparent;
      case UIAppBarVariant.primary:
        return primary;
    }
  }
}

/// A customizable AppBar widget that follows the design system.
///
/// Supports various configurations including:
/// - Centered or left-aligned titles
/// - Leading actions (back button, close button, custom widgets)
/// - Trailing actions (text buttons, icon buttons, custom widgets)
/// - Configurable background colors
/// - Configurable elevation and shadows
///
/// Example usage:
/// ```dart
/// final actionsFactory = DefaultUIAppBarActions();
/// UIAppBar(
///   title: 'My Screen',
///   centerTitle: true,
///   leading: actionsFactory.backButton(context),
///   actions: [
///     actionsFactory.textAction('Add Task', onPressed: () {}),
///   ],
/// )
/// ```
class UIAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a customizable AppBar.
  const UIAppBar({
    super.key,
    this.variant = UIAppBarVariant.standard,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.elevation = 0,
    this.shadows,
    this.toolbarHeight = 56.0,
    this.leadingWidth,
    this.automaticallyImplyLeading = true,
    this.middleSpacing,
    this.withBackButton = true,
    this.showBottomDivider,
    this.actionsFactory = const DefaultUIAppBarActions(),
  });
  // : assert(
  //        title != null || titleWidget != null,
  //        'Either title or titleWidget must be provided',
  //      );

  /// The visual style variant of the AppBar.
  final UIAppBarVariant variant;

  /// The title text to display in the AppBar.
  final String? title;
  final bool withBackButton;

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

  /// Custom shadows for the AppBar.
  final List<BoxShadow>? shadows;

  /// The height of the toolbar.
  final double toolbarHeight;

  /// The width of the leading widget.
  final double? leadingWidth;

  /// Whether to automatically add a back button if [leading] is null.
  final bool automaticallyImplyLeading;

  final double? middleSpacing;

  /// Whether to show a bottom divider line.
  ///
  /// If null, it is shown for [UIAppBarVariant.standard] and hidden otherwise.
  final bool? showBottomDivider;

  /// Factory for creating AppBar action buttons.
  ///
  /// Defaults to [DefaultUIAppBarActions]. Can be overridden for testing
  /// or to provide custom button implementations.
  final UIAppBarActionsInterface actionsFactory;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Get the style configuration for the variant
    final styleConfig = _AppBarStyleConfig.fromVariant(variant);
    final effectiveBackgroundColor =
        backgroundColor ?? styleConfig.backgroundColor;
    final effectiveForegroundColor =
        foregroundColor ?? styleConfig.foregroundColor;
    final bool shouldShowBottomDivider =
        showBottomDivider ?? variant == UIAppBarVariant.standard;

    // Build the title widget
    final Widget effectiveTitle =
        titleWidget ??
        Text(
          title!,
          style: UI.text.h4.copyWith(color: effectiveForegroundColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );

    return AppBar(
      backgroundColor: effectiveBackgroundColor,
      surfaceTintColor: UIColor.primary,
      leading: _buildLeading(context),
      title: effectiveTitle,
      actions: _buildTrailing() != null ? [_buildTrailing()!] : null,
      centerTitle: centerTitle,
    );
  }

  /// Builds the box shadow based on elevation and custom shadows.
  List<BoxShadow>? _buildBoxShadow() {
    return shadows ??
        (elevation > 0
            ? [
              BoxShadow(
                color: UIColor.shadow.withValues(alpha: 0.08),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ]
            : null);
  }

  /// Builds the leading widget with automatic back button handling.
  Widget? _buildLeading(BuildContext context) {
    final styleConfig = _AppBarStyleConfig.fromVariant(variant);
    final effectiveForegroundColor =
        foregroundColor ?? styleConfig.foregroundColor;

    final bool canPop =
        Navigator.of(context).canPop() || GoRouter.of(context).canPop();
    final Widget? effectiveLeading =
        leading ??
        (automaticallyImplyLeading && canPop
            ? actionsFactory.backButton(
              context,
              color: effectiveForegroundColor,
              onPressed: () {
                context.pop();
              },
            )
            : null);

    if (effectiveLeading == null) return null;

    return withBackButton
        ? Padding(
          padding: EdgeInsetsDirectional.only(start: UI.spacing.md),
          child: effectiveLeading,
        )
        : null;
  }

  /// Builds the trailing actions row.
  Widget? _buildTrailing() {
    if (actions == null || actions!.isEmpty) return null;

    return Padding(
      padding: EdgeInsetsDirectional.only(end: UI.spacing.md),
      child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
    );
  }
}
