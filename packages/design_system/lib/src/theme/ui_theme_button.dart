import 'package:flutter/material.dart';

import 'ui_theme.dart';
import 'ui_typography.dart';

/// A custom theme button with a distinct layered, 3D appearance.
///
/// This button uses a stack of two containers to create a visual effect of a
/// button resting on a slightly larger base, with a vertical inset from the bottom.
/// It includes a tap effect and uses colors from the MDTheme.
class UIThemeButton extends StatelessWidget {
  /// The text label displayed on the button.
  final String label;

  /// The callback that is called when the button is tapped.
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// An optional icon to display before the label.
  final IconData? leadingIcon;

  /// An optional icon to display after the label.
  final IconData? trailingIcon;

  /// The background color of the top layer of the button.
  /// Defaults to `MDTheme.styles.p2Color`.
  final Color? backgroundColor;

  /// The color of the base layer of the button, creating the inset effect.
  /// Defaults to `MDTheme.styles.p1Color`.
  final Color? baseColor;

  /// The color for the text and icons.
  /// Defaults to `Colors.white`.
  final Color? foregroundColor;

  /// The height of the button.
  /// Defaults to 52.0.
  final double height;

  /// The width of the button. If null, it sizes to its content.
  final double? width;

  /// The margin between the icon and the label.
  /// Defaults to 8.0.
  final double iconMargin;

  /// The border radius of the button's corners.
  /// Defaults to 12.0.
  final double borderRadius;

  /// The vertical inset between the top and base containers.
  /// This creates the 3D effect. Defaults to 4.0.
  final double bottomInset;

  /// The vertical padding inside the button.
  /// Defaults to 20.0.
  final double verticalPadding;

  /// The horizontal padding inside the button.
  /// Defaults to 16.0.
  final double horizontalPadding;

  /// The style of the label text.
  /// If null, defaults to `MDTypography.styles.heading4` with custom colors.
  final TextStyle? labelStyle;

  /// Creates an instance of MDThemeButton.
  const UIThemeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.backgroundColor,
    this.baseColor,
    this.foregroundColor,
    this.height = 68.0,
    this.width = double.infinity,
    this.iconMargin = 8.0,
    this.borderRadius = 50.0,
    this.bottomInset = 5.0,
    this.verticalPadding = 20.0,
    this.horizontalPadding = 16.0,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;

    // Define colors based on state and theme
    final effectiveBackgroundColor = backgroundColor ?? UITheme.styles.shade000;
    final effectiveBaseColor =
        isEnabled ? UITheme.styles.p1Color : UITheme.styles.shade400;
    final effectiveForegroundColor = foregroundColor ?? UITheme.styles.p3Color;

    final disabledBackgroundColor = UITheme.styles.shade200;
    final disabledBaseColor = UITheme.styles.shade200;
    final disabledForegroundColor = UITheme.styles.shade400;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Base container for the 3D effect
          Container(
            decoration: BoxDecoration(
              color: isEnabled ? effectiveBaseColor : disabledBaseColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          // Top container with content, inset from the bottom
          Container(
            margin: EdgeInsets.only(bottom: bottomInset),
            decoration: BoxDecoration(
              color:
                  isEnabled
                      ? effectiveBackgroundColor
                      : disabledBackgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            // InkWell for tap effects, placed inside the content container
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(borderRadius),
                splashColor: Colors.white.withOpacity(0.1),
                highlightColor: Colors.white.withOpacity(0.05),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (leadingIcon != null)
                          Icon(
                            leadingIcon,
                            color:
                                isEnabled
                                    ? effectiveForegroundColor
                                    : disabledForegroundColor,
                            size: 20,
                          ),
                        if (leadingIcon != null) SizedBox(width: iconMargin),
                        Text(
                          label,
                          style:
                              labelStyle ??
                              UITypography.styles.heading4.copyWith(
                                color:
                                    isEnabled
                                        ? effectiveForegroundColor
                                        : disabledForegroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        if (trailingIcon != null) SizedBox(width: iconMargin),
                        if (trailingIcon != null)
                          Icon(
                            trailingIcon,
                            color:
                                isEnabled
                                    ? effectiveForegroundColor
                                    : disabledForegroundColor,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
