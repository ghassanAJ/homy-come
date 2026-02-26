import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BaseCategoryItem extends StatelessWidget {
  const BaseCategoryItem({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    super.key,
    this.axis = Axis.vertical,
    this.width,
    this.iconContainerSize = 52,
    this.iconSize = 30,
    this.iconBorderRadius,
    this.itemSpacing = 8,
    this.textSpacing = 2,
    this.textAlign = TextAlign.center,
    this.textCrossAxisAlignment = CrossAxisAlignment.center,
    this.titleFontSize = 12,
    this.titleFontWeight = FontWeight.w500,
    this.subtitleFontSize = 10,
    this.subtitleFontWeight = FontWeight.w400,
    this.titleMaxLines = 1,
    this.subtitleMaxLines = 1,
    this.useBodyMediumForTitle = false,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final Axis axis;
  final double? width;
  final double iconContainerSize;
  final double iconSize;
  final BorderRadius? iconBorderRadius;
  final double itemSpacing;
  final double textSpacing;
  final TextAlign textAlign;
  final CrossAxisAlignment textCrossAxisAlignment;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double subtitleFontSize;
  final FontWeight subtitleFontWeight;
  final int titleMaxLines;
  final int subtitleMaxLines;
  final bool useBodyMediumForTitle;

  factory BaseCategoryItem.categoriesList({
    required String title,
    required String subtitle,
    required String iconPath,
    Key? key,
  }) {
    return BaseCategoryItem(
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      axis: Axis.horizontal,
      iconContainerSize: 52,
      iconSize: 30,
      iconBorderRadius:
          BorderRadius.circular(UI.radius.xs + UI.radius.sm),
      itemSpacing: UI.spacing.sm,
      textSpacing: UI.spacing.xxs,
      titleFontSize: 14,
      titleFontWeight: FontWeight.w500,
      subtitleFontSize: 10,
      subtitleFontWeight: FontWeight.w400,
      useBodyMediumForTitle: true,
      textAlign: TextAlign.start,
      textCrossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    final icon = UIIconBackground(
      borderRadius: iconBorderRadius,
      size: iconContainerSize,
      iconSize: iconSize,
      backgroundColor: UIColor.grey.withValues(alpha: 0.05),
      child: UISvg(iconPath),
    );

    final titleWidget = useBodyMediumForTitle
        ? UIText.bodyMedium(
            title,
            textAlign: textAlign,
            color: UIColor.ink,
            maxLines: titleMaxLines,
            fontSize: titleFontSize,
            fontWeight: titleFontWeight,
          )
        : UIText.bodySmall(
            title,
            textAlign: textAlign,
            color: UIColor.ink,
            maxLines: titleMaxLines,
            fontSize: titleFontSize,
            fontWeight: titleFontWeight,
          );

    final subtitleWidget = UIText.bodySmall(
      subtitle,
      textAlign: textAlign,
      color: UIColor.grey,
      maxLines: subtitleMaxLines,
      fontSize: subtitleFontSize,
      fontWeight: subtitleFontWeight,
    );

    final textBlock = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: textCrossAxisAlignment,
      children: [
        titleWidget,
        SizedBox(height: textSpacing),
        subtitleWidget,
      ],
    );

    final item = axis == Axis.horizontal
        ? Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              icon,
              SizedBox(width: itemSpacing),
              Expanded(child: textBlock),
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(height: itemSpacing),
              textBlock,
            ],
          );

    if (width == null) return item;
    return SizedBox(width: width, child: item);
  }
}