import 'package:design_system/design_system.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class CurrentOrderLocationView extends StatelessWidget {
  const CurrentOrderLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final tr =context.orderTr;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.lg,
        vertical: UI.spacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.bodyXSmall(tr.title.address, color: UIColor.grey),
                SizedBox(height: UI.spacing.xs),
                UIText.bodySmall(
                  'UEA Location name , details locations , street name 12357',
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: UI.spacing.md),
                SizedBox(
                  height: UI.spacing.xl,
                  child: Row(
                    children: [
                      Expanded(
                        child: UIButton.outlined(
                          centerLabel: true,
                          label: tr.labels.cancel,
                          onPressed: () {},
                          borderColor: UIColor.bordarCard,
                          expanded: true,
                          backgroundColor: UIColor.background,
                          borderRadius: UI.radius.xs,
                        ),
                      ),
                      SizedBox(width: UI.spacing.xs),
                      Expanded(
                        child: UIButton.primary(
                          // leadingWidget: Center(child: UIText.buttonTextsm('Details',color: UIColor.babyBlue,)),
                          label: tr.labels.details,
                          expanded: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
