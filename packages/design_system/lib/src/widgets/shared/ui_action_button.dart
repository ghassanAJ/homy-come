import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UIActionButton extends StatelessWidget {
  const UIActionButton({
    required this.label,
    required this.onTap,
    super.key,

    // Layout
    this.expanded = false,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,

    // Colors
    this.backgroundColor,
    this.textColor = UIColor.white,
    this.borderColor,
    this.splashColor,
    this.highlightColor,

    // Text
    this.textStyle,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,

    // Content
    this.leadingWidget,
    this.trailingWidget,
    this.leadingIcon,
    this.trailingIcon,
    this.svgLeading,
    this.svgTrailing,

    // State
    this.isLoading = false,
    this.centerLabel = true,
  });

  final String label;
  final VoidCallback? onTap;

  // Layout
  final bool expanded;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  // Colors
  final UIColor? backgroundColor;
  final UIColor textColor;
  final UIColor? borderColor;
  final UIColor? splashColor;
  final UIColor? highlightColor;

  // Text
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  // Content
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? svgLeading;
  final String? svgTrailing;

  // State
  final bool isLoading;
  final bool centerLabel;

  @override
  Widget build(BuildContext context) {
    final radius =
        borderRadius ?? BorderRadius.circular(UI.radius.md - UI.radius.xs);

    final effectiveBackgroundColor = backgroundColor ?? UIColor.babyBlue;
    final effectiveSplashColor =
        splashColor ?? UIColor.primary.withValues(alpha: 0.12);
    final effectiveHighlightColor =
        highlightColor ?? UIColor.primary.withValues(alpha: 0.08);

    final button = Material(
      color: effectiveBackgroundColor,
      borderRadius: radius,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: radius,
        splashColor: effectiveSplashColor,
        highlightColor: effectiveHighlightColor,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: radius,
            border:
                borderColor != null
                    ? Border.all(color: borderColor!, width: 1)
                    : null,
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: _buildContent(),
        ),
      ),
    );

    if (width != null) return SizedBox(width: width, child: button);
    if (expanded) return SizedBox(width: double.infinity, child: button);
    return button;
  }

  Widget _buildContent() {
    if (isLoading) {
      return Center(
        child: SizedBox(
          height: UI.sizes.loadingIndicatorSm,
          width: UI.sizes.loadingIndicatorSm,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: UI.sizes.loadingIndicatorStroke,
            valueColor: AlwaysStoppedAnimation<Color>(textColor),
          ),
        ),
      );
    }

    final hasLeading =
        leadingWidget != null || leadingIcon != null || svgLeading != null;

    final hasTrailing =
        trailingWidget != null || trailingIcon != null || svgTrailing != null;

    final labelWidget = Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: (textStyle ?? UI.text.bodySmall).copyWith(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );

    if (!hasLeading && !hasTrailing) {
      return Center(child: labelWidget);
    }

    final children = <Widget>[];

    final leading = _buildSide(
      widget: leadingWidget,
      icon: leadingIcon,
      svgAsset: svgLeading,
    );
    if (leading != null) {
      children.add(leading);
      children.add(SizedBox(width: UI.spacing.xs));
    }

    if (centerLabel) {
      children.add(labelWidget);
    } else {
      children.add(
        Expanded(
          child: Align(alignment: Alignment.centerLeft, child: labelWidget),
        ),
      );
    }

    final trailing = _buildSide(
      widget: trailingWidget,
      icon: trailingIcon,
      svgAsset: svgTrailing,
    );
    if (trailing != null) {
      children.add(SizedBox(width: UI.spacing.xs));
      children.add(trailing);
    }

    return Row(
      mainAxisSize: centerLabel ? MainAxisSize.min : MainAxisSize.max,
      children: children,
    );
  }

  Widget? _buildSide({Widget? widget, Widget? icon, String? svgAsset}) {
    if (widget != null) {
      return SizedBox(
        height: UI.sizes.iconMd,
        width: UI.sizes.iconMd,
        child: widget,
      );
    }

    if (icon != null) {
      return SizedBox(
        height: UI.sizes.iconSm,
        width: UI.sizes.iconSm,
        child: icon,
      );
    }

    if (svgAsset != null) {
      return SizedBox(
        width: UI.sizes.iconSm,
        height: UI.sizes.iconSm,
        child: SvgPicture.asset(
          svgAsset,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
          package: 'design_system',
        ),
      );
    }

    return null;
  }
}
