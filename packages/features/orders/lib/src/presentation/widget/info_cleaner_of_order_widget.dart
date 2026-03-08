import 'package:design_system/design_system.dart';

class OrderCleanerInfoWidget extends StatelessWidget {
  const OrderCleanerInfoWidget({
    super.key,
    required this.name,
    required this.rating,
  });
  final String name;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        //OrderCleanerInfoWidget
        horizontal: UI.spacing.md,
        vertical: UI.spacing.sm,
      ),

      child: Row(
        children: [
          SizedBox(
            child: Avatar(
              imageUrl: '',
              size: AvatarSize.medium,
              placeholderWidget: Container(
                color: UIColor.backgroungSilverLight,
              ),
            ),
          ),
          SizedBox(width: UI.spacing.xs),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIText.bodyMedium(name),

              Row(
                children: [
                  UISvg(Assets.icons.star, color: UIColor.warning),
                  SizedBox(width: UI.spacing.xxs),
                  UIText.bodyXSmall('$rating', color: UIColor.warning),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
