import 'package:design_system/design_system.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.title,
    required this.description,
    required this.iconPath,
    super.key,
  });

  final String title;
  final String description;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return BaseCategoryItem(
      title: title,
      subtitle: description,
      iconPath: iconPath,
      width: 62,
      iconContainerSize: 60,
      iconSize: 40,
      iconBorderRadius: BorderRadius.circular(UI.radius.xs + UI.radius.sm),
      itemSpacing: UI.spacing.xs,
      textSpacing: UI.spacing.xxs,
      titleFontSize: 12,
      titleFontWeight: FontWeight.w500,
      subtitleFontSize: 10,
      subtitleFontWeight: FontWeight.w400,
      titleMaxLines: 1,
      subtitleMaxLines: 1,
      textAlign: TextAlign.center,
      textCrossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
