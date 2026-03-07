
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class DirectionAndDoneActions extends StatelessWidget {
  const DirectionAndDoneActions({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Row(
      children: [
        Expanded(
          child: UIButton.outlined(
            label: tr.labels.getDirection,
            onPressed: () {
              context.push(OrderPaths.getDiraction);
            },
            expanded: true,
            centerLabel: true,
            borderRadius: 4,
            labelColor: UIColor.black,
            borderColor: UIColor.bordarCard,
            backgroundColor: UIColor.background,
          ),
        ),
        SizedBox(width: UI.spacing.xxs),
        Expanded(
          child: UIButton.primary(
            label: tr.labels.done,
            onPressed: () async {
              final confirmed = await DialogsManager.showDeleteConfirmation(
                context,
                title: tr.title.markDone,
                description: tr.title.descraptionWarning,
                confirmButtonLabel: tr.title.yes,
                cancelButtonLabel: tr.labels.cancel,
                iconColor: UIColor.softYellow
              );

              if (confirmed) {
               
              }
            },
            expanded: true,
          ),
        ),
      ],
    );
  }
}