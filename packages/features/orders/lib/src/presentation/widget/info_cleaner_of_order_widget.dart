
import 'package:design_system/design_system.dart';
import 'package:profile/src/presentation/widget/setting_option_profile_widget.dart';

class InfoCleanerOfOrderwidget extends StatelessWidget {
  const InfoCleanerOfOrderwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
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
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIText.bodyMedium('Mera ali'),

              Row(
                children: [
                  UISvg( Assets.icons.star,color: UIColor.warning,),
                  SizedBox(width: UI.spacing.xxs),
                  UIText.bodyXSmall('5.0', color: UIColor.warning),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}