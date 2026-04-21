import 'dart:developer';

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
    log('image $image');
    return Padding(
      padding: EdgeInsets.symmetric(
        //OrderCleanerInfoWidget
        // horizontal: UI.spacing.md,
        vertical: UI.spacing.sm,
      ),

      child: Row(
        children: [
          SizedBox(
            child: Avatar(
              imageUrl: image,
              size: AvatarSize.small,
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
