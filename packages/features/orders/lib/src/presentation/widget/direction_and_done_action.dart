import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';

class DirectionAndDoneActions extends StatelessWidget {
  const DirectionAndDoneActions({
    super.key,
    required this.address,
    required this.item,
    this.bottomSheetcontext,
    required this.onConfirmed,
  });
  final String address;
  final TodaySchaduleModelResponse item;
  final ValueChanged<TodaySchaduleModelResponse> onConfirmed;

  final BuildContext? bottomSheetcontext;
  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Row(
      children: [
        Expanded(
          child: UIButton.outlined(
            height: 40,
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
            labelColor: UIColor.charcoal,
            borderColor: UIColor.bordarCard,
            backgroundColor: UIColor.background,
            labelStyle: UI.text.bodySmall.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: UI.spacing.xxs),
        Expanded(
          child: UIButton.primary(
            height: 40,
            expanded: true,
            label: tr.labels.done,
            labelStyle: UI.text.bodySmall.copyWith(fontWeight: FontWeight.w600),
            onPressed: () async {
              await UIBottomSheet.show<bool>(
                context: bottomSheetcontext ?? context,
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
                      height: 40,
                      label: tr.title.yes,
                      expanded: true,
                      onPressed: () {
                        context.pop();
                        onConfirmed(item);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
