import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/presentation/widget/data_and_time_info_order_widget.dart';
import 'package:orders/src/presentation/widget/info_cleaner_of_order_widget.dart';
import 'package:orders/src/presentation/widget/location_of_myOrder_widget.dart';
import 'package:orders/src/presentation/widget/name_and_status_order_widget.dart';

class OrderStatusCardContent extends StatelessWidget {
  const OrderStatusCardContent({
    super.key,
    required this.item,
    this.withDetailsButton = true,
  });
  final BookingModelResponse item;
  final bool withDetailsButton;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderNameAndStatusWidget(name: item.serviceType, status: item.status),
          const Divider(color: UIColor.bordarCard, height: 0.5),
          OrderCleanerInfoWidget(
            image: item.provider.image ?? '',
            name: item.provider.name,
            rating: item.provider.rating,
          ),
          const Divider(color: UIColor.bordarCard, height: 0.5),
          OrderDateTimeWidget(date: item.date, time: item.time),
          const Divider(color: UIColor.bordarCard, height: 0.5),
          CurrentOrderLocationView(
            location: item.address,
            item: item,
            withDetailsButton: withDetailsButton,
            onTap: () {
              context.push(
                OrderPaths.orderDetailswithid(id: item.id),
                extra: context.read<OrderCubit>(),
              );
            },
          ),
        ],
      ),
    );
  }
}
