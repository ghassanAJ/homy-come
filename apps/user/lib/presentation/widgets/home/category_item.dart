import 'package:design_system/design_system.dart';

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
    return SizedBox(
      width: 62,
      child: Column(
        children: [
          UIIconBackground(
            size: 60,
            iconSize: 40,
            backgroundColor: UIColor.grey.withValues(alpha: 0.05),
            child: UISvg(iconPath),
          ),
          SizedBox(height: UI.spacing.xs),
          UIText.bodySmall(
            title,
            textAlign: TextAlign.center,
            color: UIColor.ink,
            maxLines: 1,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: UI.spacing.xxs),
          UIText.bodySmall(
            description,
            textAlign: TextAlign.center,
            color: UIColor.grey,
            maxLines: 1,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
