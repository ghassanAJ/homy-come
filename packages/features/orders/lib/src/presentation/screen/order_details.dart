import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:orders/src/presentation/screen/today_schedule_screen.dart';
import 'package:orders/src/presentation/widget/contact_info_cleaner.dart';
import 'package:orders/src/presentation/widget/data_and_time_info_order_widget.dart';
import 'package:orders/src/presentation/widget/direction_and_done_action.dart';
import 'package:orders/src/presentation/widget/order_error_widgert.dart';
import 'package:orders/src/presentation/widget/order_status_widget.dart';
import 'package:orders/src/presentation/widget/shimmer_schedule_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
            appBar: UIAppBar(
              titleWidget: UIText.h4(tr.title.orderDetails),
              leading: BackButtonAppBar(),
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                UI.spacing.lg,
                topContentPadding,
                UI.spacing.lg,
                0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIText.h4(tr.title.serviceDetails),
                      OrderStatusWidget(),
                    ],
                  ),
                  SizedBox(height: UI.spacing.sm),
                  BlocBuilder<OrderCubit, BaseState<OrderState>>(
                    builder: (context, state) {
                      if (state.data?.isLoadingOrderDetailsById == true) {
                        return ShimmerScheduleOrderCard();
                      } else if (state.data?.fetchOrderDetailsError != null) {
                        return OrdersErrorWidget(
                          message:
                              state.data?.fetchTodayScheduleError ?? 'error',
                          onTap: () {},
                        );
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
                              name:
                                  state
                                      .data
                                      ?.orderDetailsById
                                      ?.cleanerInfo
                                      .name ??
                                  'Maya Ali',
                              rate:
                                  state
                                      .data
                                      ?.orderDetailsById
                                      ?.cleanerInfo
                                      .rating ??
                                  0.5,
                            ),
                            Divider(height: 0.1, color: UIColor.softBordarCard),
                            OrderDateTimeWidget(
                              date: '27,dec 2024',
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
                    padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
                    child: DirectionAndDoneActions(),
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
