import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:orders/src/presentation/widget/card_status_order_widget.dart';
import 'package:orders/src/presentation/widget/no_order_found_widget.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.orders});
  final List<BookingModelResponse> orders;
  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return NoOrderFoundWidget();
    }

    return RefreshIndicator(
      color: UIColor.babyBlue,
      onRefresh: () async {
        BlocProvider.of<OrderCubit>(context).getOrders(FilterOrder.all);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.md,
          // vertical: UI.spacing.md,
        ),
        child: Builder(
          builder: (context) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return OrderStatusCardContent(item: orders[i]);
              },
              separatorBuilder: (context, _) => SizedBox(height: UI.spacing.md),
              itemCount: orders.length,
            );
          },
        ),
      ),
    );
  }
}
