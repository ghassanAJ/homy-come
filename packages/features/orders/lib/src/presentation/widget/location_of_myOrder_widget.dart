import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:user/navigation/route.dart';

class CurrentOrderLocationView extends StatelessWidget {
  const CurrentOrderLocationView({
    super.key,
    required this.location,
    required this.item,
  });

  final String location;
  final BookingModelResponse item;
  Future<void> showReasons(BuildContext context) async {
    final result =
        await BottomSheetManager.showReasonsRejectionBottomSheet<String>(
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
      context.read<OrderCubit>().cancelOrder(
        item.id,
        item.status == "scheduled"
            ? FilterOrder.scheduled
            : FilterOrder.in_progress,
        result,
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
                SizedBox(height: UI.spacing.md),
                SizedBox(
                  height: UI.spacing.xl,
                  child: Row(
                    children: [
                      Expanded(
                        child: UIButton.primary(
                          label: tr.labels.details,
                          expanded: true,
                          onPressed: () {
                            context.push(
                              UserPaths.serviceDetailsSummarywithid(
                                id: item.id,
                              ),
                            );
                          },
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
