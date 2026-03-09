import 'package:design_system/design_system.dart';

class UIRatingStars extends StatelessWidget {
  const UIRatingStars({
    super.key,
    required this.rating,
    this.maxStars = 5,
    this.color = UIColor.orange,
    this.icon,
    this.spacing,
    this.iconSize,
  });

  final double rating;
  final int maxStars;
  final UIColor color;
  final String? icon;
  final double? spacing;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final resolvedIcon = icon ?? Assets.icons.starOutline;
    final starsCount = rating.clamp(0, maxStars).round();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        starsCount,
        (_) => Padding(
          padding: EdgeInsets.only(right: spacing ?? UI.spacing.xxs),
          child: UISvg(resolvedIcon, color: color, size: iconSize),
        ),
      ),
    );
  }
}
