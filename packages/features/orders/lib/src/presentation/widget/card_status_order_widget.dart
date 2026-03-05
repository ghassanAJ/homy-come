import 'package:design_system/design_system.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/presentation/widget/content_card_status_order.dart';

class OrderStatusCardContent extends StatelessWidget {
  const OrderStatusCardContent({super.key, required this.item});
  final BookingModelResponse item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        UI.spacing.xxs,
        UI.spacing.xs,
        UI.spacing.xxs,
        UI.spacing.sm,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UI.radius.md),
        color: UIColor.background,
        border: Border.all(color: UIColor.bordarCard, width: 0.8),
      ),
      child: ContentCardStatusOrder(item: item),
    );
  }
}
