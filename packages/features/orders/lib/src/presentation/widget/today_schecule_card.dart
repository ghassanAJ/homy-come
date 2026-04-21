import 'package:design_system/design_system.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:orders/src/presentation/widget/direction_and_done_action.dart';
import 'package:orders/src/presentation/widget/info_cleaner_of_order_widget.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({super.key, required this.item});
  final TodaySchaduleModelResponse item;
  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Container(
      margin: EdgeInsets.only(bottom: UI.spacing.xs),
      padding: EdgeInsets.fromLTRB(
        UI.spacing.md,
        UI.spacing.md,
        UI.spacing.md,
        UI.spacing.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UI.radius.md),
        border: Border.all(color: UIColor.bordarCard),
        color: UIColor.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.h3(
            '${item.time} PM',
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          SizedBox(height: UI.spacing.xxs),
          UIText.bodyMedium(
            '${tr.title.address}:',
            color: UIColor.textNatral600,
            fontFamily: 'Roboto',
          ),
          UIText.bodyMedium(
            item.address,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          SizedBox(height: UI.spacing.xxs),
          OrderCleanerInfoWidget(
            name: item.cleanerInfo.name,
            rating: 5.0,
            image: item.cleanerInfo.image ?? '',
          ),
          SizedBox(height: UI.spacing.xxs),
          DirectionAndDoneActions(),
        ],
      ),
    );
  }
}
