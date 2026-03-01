import 'package:design_system/design_system.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:notifications/src/presentation/widgets/notification_card.dart';

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
      padding: EdgeInsetsDirectional.only(
        bottom: isLast ? 0 : UI.spacing.lg + UI.spacing.xxs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.bodySmall(
            section.label,
            color: UIColor.neutral300,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          SizedBox(height: UI.spacing.xs),
          for (int i = 0; i < section.items.length; i++)
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: i == section.items.length - 1 ? 0 : UI.spacing.sm,
              ),
              child: NotificationCard(item: section.items[i]),
            ),
        ],
      ),
    );
  }
}
