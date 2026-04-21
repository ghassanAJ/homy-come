import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';

class DirectionAndDoneActions extends StatelessWidget {
  const DirectionAndDoneActions({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Row(
      children: [
        Expanded(
          child: UIButton.outlined(
            label: tr.labels.getDirection,
            onPressed: () {
              context.push(
                OrderPaths.getDiraction,
                extra: {'address': address},
              );
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
              // final confirmed = await

              UIBottomSheet.show(
                content: Column(
                  children: [
                    UIText.bodyLarge(
                      tr.title.markDone,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    UIText.h3(tr.title.descraptionWarning),
                    SizedBox(height: 16),

                    UIButton.primary(
                      label: tr.title.yes,
                      expanded: true,
                      onPressed: () => Navigator.pop(context, true),
                    ),
                  ],
                ),
                context: StatefulNavigationShell.of(context).context,
                // title:,
                // description: ,
                // confirmButtonLabel: tr.title.yes,
                // cancelButtonLabel: tr.labels.cancel,
                // iconColor: UIColor.softYellow, context:context,
              );

              // if (confirmed) {

              // }
            },
            expanded: true,
          ),
        ),
      ],
    );
  }
}
