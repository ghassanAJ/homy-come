import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/presentation/widget/contact_info_cleaner.dart';
import 'package:orders/src/presentation/widget/data_and_time_info_order_widget.dart';
import 'package:orders/src/presentation/widget/direction_and_done_action.dart';
import 'package:orders/src/presentation/widget/no_order_found_widget.dart';
import 'package:orders/src/presentation/widget/order_error_widgert.dart';
import 'package:orders/src/presentation/widget/shimmer_schedule_card.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;
    return BlocProvider(
      create:
          (context) => diContainerOrder<OrderCubit>()..getOrderDetailsById(id),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.h4(tr.title.serviceDetails),
                  // OrderStatusWidget(),
                  SizedBox(height: UI.spacing.sm),
                  BlocBuilder<OrderCubit, BaseState<OrderState>>(
                    builder: (context, state) {
                      final data = state.data ?? OrderState();
                      if (state.data?.isLoadingOrderDetailsById == true) {
                        return ShimmerScheduleOrderCard();
                      } else if (state.data?.fetchOrderDetailsError != null) {
                        return OrdersErrorWidget(
                          message:
                              state.data?.fetchTodayScheduleError ?? 'error',
                          onTap: () {},
                        );
                      }
                      if (data.orderDetailsById == null) {
                        return NoOrderFoundWidget();
                      }
                      return Container(
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
                                  data.orderDetailsById!.cleanerInfo.image ??
                                  '',
                              name: data.orderDetailsById!.cleanerInfo.name,
                              rate:
                                  state
                                      .data
                                      ?.orderDetailsById
                                      ?.cleanerInfo
                                      .rating ??
                                  0.5,
                              phoneNUmber:
                                  data
                                      .orderDetailsById!
                                      .cleanerInfo
                                      .numberPhone,
                            ),
                            Divider(height: 0.1, color: UIColor.softBordarCard),
                            OrderDateTimeWidget(
                              date: data.orderDetailsById!.date,
                              time: state.data?.orderDetailsById?.time ?? '',
                            ),
                            Divider(height: 0.1, color: UIColor.softBordarCard),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: UI.spacing.lg,
                                vertical: UI.spacing.sm,
                              ),
                              child: LocationWithMapWidget(
                                address:
                                    state.data?.orderDetailsById?.address ?? '',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: UI.spacing.xl),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: UI.spacing.md,
                      vertical: 24,
                    ),
                    child: DirectionAndDoneActions(
                      address:
                          context
                              .read<OrderCubit>()
                              .state
                              .data
                              ?.orderDetailsById
                              ?.address ??
                          '',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
