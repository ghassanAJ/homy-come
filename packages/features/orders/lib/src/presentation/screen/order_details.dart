import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/presentation/widget/contact_info_cleaner.dart';
import 'package:orders/src/presentation/widget/data_and_time_info_order_widget.dart';
import 'package:orders/src/presentation/widget/direction_and_done_action.dart';
import 'package:orders/src/presentation/widget/no_order_found_widget.dart';
import 'package:orders/src/presentation/widget/order_error_widgert.dart';
import 'package:orders/src/presentation/widget/shimmer_schedule_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.id, required this.cubit});
  final int id;
  final OrderCubit cubit;
  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;

    return BlocProvider.value(
      value: cubit..getOrderDetailsById(id),
      child: Builder(
        builder: (context) {
          return UIScaffold(
            appBar: UIAppBar(titleWidget: UIText.h4(tr.title.orderDetails)),
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                UI.spacing.lg,
                24,
                UI.spacing.lg,
                12,
              ),
              child: BlocBuilder<OrderCubit, OrderState>(
                // listenWhen:
                //     (previous, current) =>
                //         previous.schaduledOrder.length !=
                //             current.schaduledOrder.length ||
                //         previous.isOrderStatusChangeLoading !=
                //             current.isOrderStatusChangeLoading ||
                //         previous.isOrderStatusChanged !=
                //             current.isOrderStatusChanged,
                // listener: (context, state) {
                //   log('listen from card');

                //   if (state.isOrderStatusChangeLoading) {
                //     DialogsManager.showLoading(context);
                //   }
                //   if (state.isOrderStatusChanged) {
                //     context.pop();
                //     DialogsManager.hideLoading(context);

                //     // ToastificationUtil.success('Order updated successfully');
                //   }
                // },
                builder: (context, state) {
                  if (state.isLoadingOrderDetailsById == true) {
                    return ShimmerScheduleOrderCard();
                  } else if (state.fetchOrderDetailsError != null) {
                    return OrdersErrorWidget(
                      message: state.fetchTodayScheduleError ?? 'error',
                      onTap: () {},
                    );
                  }
                  if (state.orderDetailsById == null) {
                    return NoOrderFoundWidget();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText.h4(tr.title.serviceDetails),
                      // OrderStatusWidget(),
                      SizedBox(height: UI.spacing.sm),
                      Container(
                        padding: EdgeInsets.all(UI.spacing.xxs),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(UI.radius.md),
                          border: Border.all(color: UIColor.softBordarCard),
                          color: UIColor.background,
                        ),
                        child: Column(
                          children: [
                            ContactInfoCleaner(
                              image:
                                  state.orderDetailsById!.cleanerInfo.image ??
                                  '',
                              name: state.orderDetailsById!.cleanerInfo.name,
                              rate:
                                  state.orderDetailsById?.cleanerInfo.rating ??
                                  0.5,
                              phoneNUmber:
                                  state
                                      .orderDetailsById!
                                      .cleanerInfo
                                      .numberPhone,
                            ),
                            Divider(height: 0.1, color: UIColor.softBordarCard),
                            OrderDateTimeWidget(
                              date: state.orderDetailsById!.date,
                              time: state.orderDetailsById?.time ?? '',
                            ),
                            Divider(height: 0.1, color: UIColor.softBordarCard),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: UI.spacing.lg,
                                vertical: UI.spacing.sm,
                              ),
                              child: LocationWithMapWidget(
                                address: state.orderDetailsById?.address ?? '',
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: UI.spacing.xl),
                      if (context.read<AppCubit>().state.userType ==
                          UserRole.driver)
                        BlocConsumer<OrderCubit, OrderState>(
                          listenWhen:
                              (previous, current) =>
                                  previous.isOrderStatusChangeLoading !=
                                      current.isOrderStatusChangeLoading ||
                                  previous.isOrderStatusChanged !=
                                      current.isOrderStatusChanged,
                          listener: (context, state) {
                            if (state.isOrderStatusChangeLoading) {
                              DialogsManager.showLoading(context);
                            }

                            if (state.isOrderStatusChanged) {
                              DialogsManager.hideLoading(context);

                              context.pop(); // ✅ navigate back
                            }
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: UI.spacing.md,
                                vertical: 24,
                              ),
                              child: DirectionAndDoneActions(
                                onConfirmed: (value) {
                                  context.read<OrderCubit>().changeOrderStatus(
                                    state.orderDetailsById!.id,
                                    OrderStatus.completed,
                                  );
                                  // DialogsManager.showLoading(context);
                                },
                                item: state.orderDetailsById!,
                                address:
                                    context
                                        .read<OrderCubit>()
                                        .state
                                        .orderDetailsById
                                        ?.address ??
                                    '',
                              ),
                            );
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
