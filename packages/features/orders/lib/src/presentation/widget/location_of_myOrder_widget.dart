import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class CurrentOrderLocationView extends StatelessWidget {
  const CurrentOrderLocationView({
    super.key,
    required this.location,
    required this.item,
    required this.onTap,
    this.withDetailsButton = true,
  });

  final bool withDetailsButton;
  final VoidCallback onTap;
  final String location;
  final BookingModelResponse item;
  Future<void> showReasons(BuildContext context) async {
    final result =
        await BottomSheetManager.showReasonsRejectionBottomSheet<String?>(
          context,
          title: 'Reject Order',
          description: 'Please select a reason for rejection',
          reasons: const [
            'Service price is not suitable',
            'Change of plans',
            'Booked by mistake',
            'Other',
          ],
        );

    if (result != null) {
      context.read<OrderCubit>().changeOrderStatus(
        item.id,
        item.status == OrderStatus.scheduled
            ? OrderStatus.scheduled
            : OrderStatus.inProgress,
        reason: result,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
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
                SizedBox(height: 2),
                UIText.bodySmall(location, overflow: TextOverflow.clip),
                if (withDetailsButton) ...[
                  SizedBox(height: UI.spacing.md),

                  SizedBox(
                    height: UI.spacing.xl,
                    child: Row(
                      children: [
                        Expanded(
                          child: UIButton.primary(
                            label: tr.labels.details,
                            expanded: true,
                            onPressed: onTap,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
