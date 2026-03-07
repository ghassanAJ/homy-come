
import 'package:design_system/design_system.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.xs,
        vertical: UI.spacing.xxs,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: UIColor.babyBlue, width: 1),
        borderRadius: BorderRadius.circular(UI.radius.xl),
      ),
      child: UIText.headerBody(tr.title.inProgess, color: UIColor.babyBlue),
    );
  }
}
