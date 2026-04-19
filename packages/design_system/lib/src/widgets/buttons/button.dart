import 'package:flutter_svg/flutter_svg.dart';

import '../../../design_system.dart';

// =============================================================================
// CONFIGURATION
// =============================================================================

/// Internal configuration class that defines button visual style
///
/// This class holds all styling properties for a button variant.
/// By extracting this into a separate configuration object, we achieve
/// zero code duplication - all button types share the same rendering logic.
class _ButtonStyleConfig {
  /// Background color when button is enabled
  final Color backgroundColor;

  /// Text and icon color when button is enabled
  final Color foregroundColor;

  /// Background color when button is disabled
  final Color disabledBackgroundColor;

  /// Text and icon color when button is disabled
  final Color disabledForegroundColor;

  /// Whether to use ElevatedButton or TextButton as base
  final bool isTextButton;

  const _ButtonStyleConfig({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.disabledBackgroundColor,
    required this.disabledForegroundColor,
    this.isTextButton = false,
  });

  /// Primary button style configuration
  static final primary = _ButtonStyleConfig(
    backgroundColor: UIColor.black,
    foregroundColor: UIColor.babyBlue,
    disabledBackgroundColor: UIColor.black.withOpacity(.4),
    disabledForegroundColor: UIColor.babyBlue,
  );

  /// Secondary button style configuration
  static final secondary = _ButtonStyleConfig(
    backgroundColor: UIColor.secondary,
    foregroundColor: UIColor.primary,
    disabledBackgroundColor: UIColor.backgroundInactive,
    disabledForegroundColor: UIColor.onPrimary,
  );

  /// Text button style configuration
  static final text = _ButtonStyleConfig(
    backgroundColor: Colors.transparent,
    foregroundColor: UIColor.primary,
    disabledBackgroundColor: Colors.transparent,
    disabledForegroundColor: UIColor.backgroundInactive,
    isTextButton: true,
  );

  /// Brand button style configuration (for OAuth providers, external services)
  ///
  /// This configuration is designed for third-party branded buttons like
  /// "Sign in with Google", "Continue with Apple", payment providers, etc.
  /// Note: This provides a base style. Colors can be customized per instance
  /// to match specific brand guidelines.
  static final brand = _ButtonStyleConfig(
    backgroundColor: Color(0xff282828),
    foregroundColor: const Color(0xFF1F2937), // Dark gray/black
    disabledBackgroundColor: const Color(0xFFF3F4F6), // Light gray
    disabledForegroundColor: const Color(0xFF9CA3AF), // Medium gray
    isTextButton: false,
  );
}

class _BaseButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final _ButtonStyleConfig styleConfig;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final bool isLoading;
  final bool expanded;
  final double? width;
  final UIColor? customBackgroundColor;
  final UIColor? customForegroundColor;
  final UIColor? borderColor;
  final double? borderRadius;
  final bool? centerLabel;
  final UIColor? labelColor;

  const _BaseButton({
    required this.label,
    required this.styleConfig,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.isLoading = false,
    this.expanded = false,
    this.width,
    this.centerLabel,
    this.customBackgroundColor,
    this.customForegroundColor,
    this.borderColor,
    this.borderRadius,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    final button = _buildButton();

    // Handle width constraints
    if (width != null) {
      return SizedBox(width: width, child: button);
    }

    if (expanded) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  /// Builds the appropriate button widget based on configuration
  Widget _buildButton() {
    final content = _buildContent();
    final effectiveBackgroundColor =
        customBackgroundColor ?? styleConfig.backgroundColor;
    final effectiveForegroundColor =
        customForegroundColor ?? styleConfig.foregroundColor;
    final effectiveBorderRadius = borderRadius ?? UI.radius.button;

    // Use smaller vertical padding if button has icons or custom widgets
    final hasIcons =
        leadingIcon != null ||
        trailingIcon != null ||
        leadingWidget != null ||
        trailingWidget != null;
    final verticalPadding =
        hasIcons
            ? UI.spacing.buttonWithIconVertical
            : UI.spacing.buttonVertical;

    if (styleConfig.isTextButton) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: effectiveForegroundColor,
          disabledForegroundColor: styleConfig.disabledForegroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: UI.spacing.buttonHorizontal,
            vertical: verticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
          ),
        ),
        child: content,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        // maximumSize: Size(double.infinity, 24),
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        disabledBackgroundColor: styleConfig.disabledBackgroundColor,
        disabledForegroundColor: styleConfig.disabledForegroundColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.buttonHorizontal,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          side:
              borderColor != null
                  ? BorderSide(color: borderColor!, width: 1)
                  : BorderSide.none,
        ),
      ),
      child: content,
    );
  }

  /// Builds the button content (loading indicator, icons, or text)
  Widget _buildContent() {
    // Show loading indicator when in loading state
    if (isLoading) {
      return Center(
        child: SizedBox(
          // height: UI.sizes.loadingIndicatorSm,
          // width: UI.sizes.loadingIndicatorSm,
          child: CircularProgressIndicator.adaptive(
            // strokeWidth: UI.sizes.loadingIndicatorStroke,
            // valueColor: AlwaysStoppedAnimation<Color>(
            //   customForegroundColor ?? styleConfig.foregroundColor,
            // ),
          ),
        ),
      );
    }

    // Build content with icons/widgets if present
    final isCenterLabel = centerLabel ?? true;
    final hasLeadingWidget = leadingWidget != null;
    final hasLeadingIcon = leadingIcon != null;
    final hasTrailingWidget = trailingWidget != null;
    final hasTrailingIcon = trailingIcon != null;

    if (!isCenterLabel) {
      final List<Widget> alignedChildren = [];

      if (hasLeadingWidget) {
        alignedChildren.add(
          SizedBox(
            height: UI.sizes.iconMd,
            width: UI.sizes.iconMd,
            child: leadingWidget!,
          ),
        );
      } else if (hasLeadingIcon) {
        alignedChildren.add(
          SizedBox(
            height: UI.sizes.iconSm,
            width: UI.sizes.iconSm,
            child: leadingIcon!,
          ),
        );
      }

      if (alignedChildren.isNotEmpty) {
        alignedChildren.add(SizedBox(width: UI.spacing.xs));
      }

      alignedChildren.add(
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: UIText.bodyMedium(label, color: customForegroundColor),
          ),
        ),
      );

      if (hasTrailingWidget) {
        alignedChildren.add(SizedBox(width: UI.spacing.xs));
        alignedChildren.add(
          SizedBox(
            height: UI.sizes.iconMd,
            width: UI.sizes.iconMd,
            child: trailingWidget!,
          ),
        );
      } else if (hasTrailingIcon) {
        alignedChildren.add(SizedBox(width: UI.spacing.xs));
        alignedChildren.add(
          SizedBox(
            height: UI.sizes.iconSm,
            width: UI.sizes.iconSm,
            child: trailingIcon!,
          ),
        );
      }

      return Row(mainAxisSize: MainAxisSize.max, children: alignedChildren);
    }

    final List<Widget> children = [];

    // Add leading icon or widget
    if (hasLeadingWidget) {
      children.add(
        SizedBox(
          height: UI.sizes.iconMd,
          width: UI.sizes.iconMd,
          child: leadingWidget!,
        ),
      );
      children.add(SizedBox(width: UI.spacing.xs));
    } else if (hasLeadingIcon) {
      children.add(
        SizedBox(
          height: UI.sizes.iconSm,
          width: UI.sizes.iconSm,
          child: leadingIcon!,
        ),
      );
      children.add(SizedBox(width: UI.spacing.xs));
    }

    children.add(UIText.buttonText(label, color: customForegroundColor));

    // Add trailing icon or widget
    if (hasTrailingWidget) {
      children.add(SizedBox(width: UI.spacing.xs));
      children.add(
        SizedBox(
          height: UI.sizes.iconMd,
          width: UI.sizes.iconMd,
          child: trailingWidget!,
        ),
      );
    } else if (hasTrailingIcon) {
      children.add(SizedBox(width: UI.spacing.xs));
      children.add(
        SizedBox(
          height: UI.sizes.iconSm,
          width: UI.sizes.iconSm,
          child: trailingIcon!,
        ),
      );
    }

    // Return single text if no icons, otherwise return row
    if (children.length == 1) {
      return children.first;
    }

    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }
}

// =============================================================================
// PUBLIC API
// =============================================================================

/// A simple, customizable button component
///
/// Supports three visual styles via factory constructors:
/// - `Button.primary()` - Filled button with primary color
/// - `Button.secondary()` - Filled button with secondary color
/// - `Button.text()` - Text-only button with no background
///
/// All button types support:
/// - Loading states
/// - Leading and trailing icons
/// - Width customization (expanded or fixed width)
/// - Disabled states
///
/// Example:
/// ```dart
/// // Primary button
/// Button.primary(
///   label: 'Submit',
///   onPressed: () => print('Submitted!'),
/// )
///
/// // Secondary button with icon
/// Button.secondary(
///   label: 'Cancel',
///   leadingIcon: Icon(Icons.close),
///   onPressed: () => print('Cancelled'),
/// )
///
/// // Text button in loading state
/// Button.text(
///   label: 'Loading...',
///   isLoading: true,
/// )
///
/// // Expanded button
/// Button.primary(
///   label: 'Full Width',
///   expanded: true,
///   onPressed: () {},
/// )
/// ```
class UIButton {
  // Private constructor to prevent direct instantiation
  UIButton._();

  /// Creates a primary button with filled background
  ///
  /// Uses the primary color (Majorelle Blue) for background
  /// and white for text/icons.
  ///
  /// Parameters:
  /// - [label]: Button text (required)
  /// - [onPressed]: Callback when pressed (null = disabled)
  /// - [leadingWidget]: Optional widget before the label
  /// - [trailingIcon]: Optional widget after the label
  /// - [isLoading]: Shows loading indicator instead of content
  /// - [expanded]: Expands button to fill available width
  /// - [width]: Sets a specific fixed width
  static Widget primary({
    required String label,
    VoidCallback? onPressed,
    Widget? leadingWidget,
    Widget? trailingIcon,
    bool isLoading = false,
    bool expanded = false,
    double? width,
  }) {
    return _BaseButton(
      borderRadius: 4,
      label: label,
      onPressed: onPressed,
      styleConfig: _ButtonStyleConfig.primary,
      leadingIcon: leadingWidget,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      expanded: expanded,
      width: width,
    );
  }

  /// Creates a secondary button with light purple background
  ///
  /// Uses the secondary color (light purple) for background
  /// and primary color for text/icons.
  ///
  /// Parameters:
  /// - [label]: Button text (required)
  /// - [onPressed]: Callback when pressed (null = disabled)
  /// - [leadingIcon]: Optional widget before the label
  /// - [trailingIcon]: Optional widget after the label
  /// - [isLoading]: Shows loading indicator instead of content
  /// - [expanded]: Expands button to fill available width
  /// - [width]: Sets a specific fixed width
  static Widget secondary({
    required String label,
    VoidCallback? onPressed,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    bool expanded = false,
    double? width,
  }) {
    return _BaseButton(
      label: label,
      onPressed: onPressed,
      styleConfig: _ButtonStyleConfig.secondary,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      expanded: expanded,
      width: width,
    );
  }

  /// Creates a text-only button with no background
  ///
  /// Uses primary color for text/icons with transparent background.
  ///
  /// Parameters:
  /// - [label]: Button text (required)
  /// - [onPressed]: Callback when pressed (null = disabled)
  /// - [leadingIcon]: Optional widget before the label
  /// - [trailingIcon]: Optional widget after the label
  /// - [isLoading]: Shows loading indicator instead of content
  /// - [expanded]: Expands button to fill available width
  /// - [width]: Sets a specific fixed width
  static Widget text({
    required String label,
    VoidCallback? onPressed,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    bool expanded = false,
    double? width,
    UIColor? labelColor,
  }) {
    return _BaseButton(
      label: label,
      onPressed: onPressed,
      styleConfig: _ButtonStyleConfig.text,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      expanded: expanded,
      width: width,
    );
  }

  /// Creates a brand button for OAuth providers and external services
  ///
  /// Designed for third-party branded buttons like "Sign in with Google",
  /// "Continue with Apple", payment providers, or any external service.
  /// Features a white background with rounded pill shape and supports
  /// custom logos via the [leadingWidget] or [trailingWidget] parameters.
  ///
  /// This button type is provider-agnostic - colors and branding can be
  /// customized to match any service's brand guidelines.
  ///
  /// Example with custom widget (SVG logo):
  /// ```dart
  /// Button.brand(
  ///   label: 'Sign in with Google',
  ///   leadingWidget: SvgPicture.asset('assets/google_logo.svg'),
  ///   backgroundColor: Colors.white,
  ///   foregroundColor: Colors.black87,
  ///   borderColor: Colors.grey[300],
  ///   onPressed: () => handleGoogleLogin(),
  /// )
  /// ```
  ///
  /// Parameters:
  /// - [label]: Button text (required)
  /// - [onPressed]: Callback when pressed (null = disabled)
  /// - [leadingWidget]: Custom widget for logo/icon (SVG, Image, etc.)
  /// - [trailingWidget]: Custom widget after the label
  /// - [leadingIcon]: Widget if using standard icons instead of widgets
  /// - [trailingIcon]: Widget after the label
  /// - [backgroundColor]: Custom background color (default: white)
  /// - [foregroundColor]: Custom text/icon color (default: dark gray)
  /// - [borderColor]: Border color (default: none)
  /// - [borderRadius]: Border radius (default: 100 for pill shape)
  /// - [isLoading]: Shows loading indicator instead of content
  /// - [expanded]: Expands button to fill available width
  /// - [width]: Sets a specific fixed width
  static Widget outlined({
    required String label,
    VoidCallback? onPressed,
    Widget? leadingWidget,
    Widget? trailingWidget,
    Widget? leadingIcon,
    Widget? trailingIcon,
    UIColor? backgroundColor,
    UIColor? foregroundColor,
    UIColor? borderColor,
    double? borderRadius,
    bool isLoading = false,
    bool expanded = false,
    double? width,
    bool? centerLabel,
    UIColor? labelColor,
  }) {
    return _BaseButton(
      label: label,
      onPressed: onPressed,
      styleConfig: _ButtonStyleConfig.brand,
      leadingWidget: leadingWidget,
      trailingWidget: trailingWidget,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      customBackgroundColor: backgroundColor,
      customForegroundColor: foregroundColor,
      borderColor: borderColor ?? UIColor.neutral200,
      borderRadius: borderRadius ?? 16, // Pill shape by default
      isLoading: isLoading,
      expanded: expanded,
      width: width,
      centerLabel: centerLabel,
      labelColor: labelColor ?? UIColor.neutral500,
    );
  }

  /// Creates an icon-only button with transparent background
  ///
  /// Designed for icon-only buttons in AppBars, toolbars, and action areas.
  /// Uses circular shape with proper touch targets and Material splash effects.
  ///
  /// Supports both Material icons and SVG assets.
  ///
  /// Example with Material icon:
  /// ```dart
  /// Button.icon(
  ///   icon: Icons.arrow_back,
  ///   onPressed: () => Navigator.pop(context),
  /// )
  /// ```
  ///
  /// Example with SVG asset:
  /// ```dart
  /// Button.icon(
  ///   svgAsset: 'assets/icons/close.svg',
  ///   onPressed: () => Navigator.pop(context),
  /// )
  /// ```
  ///
  /// Parameters:
  /// - [icon]: Material IconData (either icon or svgAsset required)
  /// - [svgAsset]: Path to SVG asset (either icon or svgAsset required)
  /// - [onPressed]: Callback when pressed (null = disabled)
  /// - [color]: Icon color (default: textPrimary)
  static Widget icon({
    IconData? icon,
    String? svgAsset,
    required VoidCallback? onPressed,
    Color? color,
  }) {
    assert(
      icon != null || svgAsset != null,
      'Either icon or svgAsset must be provided',
    );

    return _IconButton(
      icon: icon,
      svgAsset: svgAsset,
      onPressed: onPressed,
      color: color,
    );
  }
}

// =============================================================================
// ICON BUTTON IMPLEMENTATION
// =============================================================================

/// Internal icon-only button implementation
///
/// This provides icon-only buttons with circular splash effects
/// and proper Material Design touch targets.
class _IconButton extends StatelessWidget {
  final IconData? icon;
  final String? svgAsset;
  final VoidCallback? onPressed;
  final Color? color;

  const _IconButton({
    this.icon,
    this.svgAsset,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? UIColor.textPrimary;
    const double iconButtonSize = 40.0; // Standard touch target size

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        splashColor: UIColor.primary.withValues(alpha: 0.12),
        highlightColor: UIColor.primary.withValues(alpha: 0.08),
        child: SizedBox(
          width: iconButtonSize,
          height: iconButtonSize,
          child: Center(
            child:
                svgAsset != null
                    ? UIIconBackground(
                      backgroundColor: UIColor.neutral100,
                      width: 28,
                      height: 28,
                      child: SizedBox(
                        child: SvgPicture.asset(
                          svgAsset!,
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                            effectiveColor,
                            BlendMode.srcIn,
                          ),
                          package: 'design_system',
                        ),
                      ),
                    )
                    : Icon(icon!, size: UI.sizes.iconLg, color: effectiveColor),
          ),
        ),
      ),
    );
  }
}
