import 'package:design_system/design_system.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.item});

  final NotificationItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: UI.padding.notificationsCardContent,
      decoration: BoxDecoration(
        color:
            item.isHighlighted
                ? UIColor.softGreen.withValues(alpha: 0.32)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(UI.radius.xs),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.bodyMedium(
            item.title,
            fontWeight: FontWeight.w500,
            color: UIColor.neutral950,
            fontFamily: UIFontFamily.poppins,
          ),
          SizedBox(height: UI.spacing.xxs),
          UIText.bodyXSmall(
            item.description,
            color: UIColor.neutral450,
            fontFamily: UIFontFamily.poppins,
            maxLines: 2,
          ),
          SizedBox(height: UI.spacing.xxs),
          UIText.bodyXSmall(
            item.timeAgo,
            color: UIColor.neutral450,
            fontFamily: UIFontFamily.poppins,
          ),
        ],
      ),
    );
  }
}
