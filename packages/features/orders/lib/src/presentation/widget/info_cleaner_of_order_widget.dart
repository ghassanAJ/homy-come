import 'package:design_system/design_system.dart';

class OrderCleanerInfoWidget extends StatelessWidget {
  const OrderCleanerInfoWidget({
    super.key,
    required this.name,
    required this.rating,
    required this.image,
  });
  final String name;
  final String image;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        //OrderCleanerInfoWidget
        // horizontal: UI.spacing.md,
        vertical: UI.spacing.sm,
      ),

      child: Row(
        children: [
          SizedBox(width: UI.spacing.md),

          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: UIColor.babyPink,
            ),
            child: UINetworkImage(imageUrl: image),
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
