import 'package:design_system/design_system.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:notifications/src/presentation/widgets/notification_card.dart';
import 'package:util/util.dart';

class NotificationSection {
  const NotificationSection({required this.label, required this.items});

  final String label;
  final List<NotificationItemModel> items;
}

class NotificationSectionView extends StatelessWidget {
  const NotificationSectionView({
    super.key,
    required this.section,
    required this.isLast,
  });

  final NotificationSection section;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UI.padding.notificationsSectionSpacing(isLast: isLast),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.bodySmall(
            section.label,
            color: UIColor.neutral300,
            fontWeight: FontWeight.w500,
            fontFamily: UIFontFamily.roboto,
          ),
          SizedBox(height: UI.spacing.xs),

          ...ListWidgetBuilder.mapWithIsLast(section.items, (
            item,
            _,
            isLastItem,
          ) {
            return Padding(
              padding: UI.padding.notificationsItemSpacing(isLast: isLastItem),
              child: NotificationCard(item: item),
            );
          }),
        ],
      ),
    );
  }
}
