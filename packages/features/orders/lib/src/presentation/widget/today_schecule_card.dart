

import 'package:design_system/design_system.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:orders/src/presentation/screen/today_schedule_screen.dart';
import 'package:orders/src/presentation/widget/direction_and_done_action.dart';
import 'package:orders/src/presentation/widget/info_cleaner_of_order_widget.dart';

class TodayScheduleCard extends StatelessWidget {
  TodayScheduleCard({super.key, required this.item});
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
          UIText.h3(item.time, fontFamily: 'Roboto'),
          SizedBox(height: UI.spacing.sm),
          UIText.bodyMedium('${tr.title.address}:', color: UIColor.textNatral600),
          UIText.titleMd(item.address),
          SizedBox(height: UI.spacing.sm),
          OrderCleanerInfoWidget(name: item.cleanerInfo.name, rating: 5.0),
          SizedBox(height: UI.spacing.md),
          DirectionAndDoneActions(),
        ],
      ),
    );
  }
}
