import 'package:design_system/design_system.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class OrderNameAndStatusWidget extends StatelessWidget {
  const OrderNameAndStatusWidget({
    super.key,
    required this.name,
    required this.status,
  });
  final String name;
  final String status;
  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        UI.spacing.md,
        UI.spacing.xxs,
        UI.spacing.md,
        UI.spacing.xs,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: UI.sizes.iconXl,
                height: UI.sizes.iconXl,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: UIColor.backgroungSilverLight,
                ),
              ),
              SizedBox(width: UI.spacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.bodyMedium(
                    '${tr.title.serviceType}:',
                    color: UIColor.grey,
                  ),
                  UIText.headerBody(name),
                ],
              ),
            ],
          ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: UI.spacing.xs,
              vertical: UI.spacing.xxs,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: UIColor.babyBlue, width: 1),
              borderRadius: BorderRadius.circular(UI.radius.xl),
            ),
            child: UIText.headerBody(status, color: UIColor.babyBlue),
          ),
        ],
      ),
    );
  }
}
