import 'dart:developer';
import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:orders/src/presentation/widget/order_error_widgert.dart';
import 'package:orders/src/presentation/widget/shimmer_schedule_card.dart';
import 'package:orders/src/presentation/widget/today_schecule_card.dart';

class TodayScheduleScreen extends StatefulWidget {
  const TodayScheduleScreen({super.key});

  @override
  State<TodayScheduleScreen> createState() => _TodayScheduleScreenState();
}

class _TodayScheduleScreenState extends State<TodayScheduleScreen> {
  late final OrderCubit _orderCubit;
  @override
  void initState() {
    _orderCubit = diContainerOrder<OrderCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _orderCubit..getTodayScheduleOrders(),
      child: Builder(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<OrderCubit>(context).getTodayScheduleOrders();
            },
            child: UIScaffold(
              body: CustomScrollView(
                slivers: [
                  UISliverAppBar(
                    // TODO :delete app bar
                    titleWidget: UIText.h4('Today’s Schedule'),
                    centerTitle: true,
                    variant: UISliverAppBarVariant.transparent,
                  ),
                  _buildSectionTitle(),
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      UI.spacing.md,
                      0,
                      UI.spacing.md,
                      0,
                    ),
                    sliver: BlocBuilder<OrderCubit, BaseState<OrderState>>(
                      builder: (context, state) {
                        var data = state.data ?? OrderState();
                        List<TodaySchaduleModelResponse> allData =
                            data.todaySchaduleOrder;
                        log('${allData.length}.....');
                        if (state.data?.isLoadingTodayScheduleOrder == true) {
                          return SliverToBoxAdapter(
                            child: ShimmerScheduleOrderCard(),
                          );
                        } else if (state.data?.fetchTodayScheduleError !=
                            null) {
                          return SliverToBoxAdapter(
                            child: OrdersErrorWidget(
                              message:
                                  state.data?.fetchTodayScheduleError ??
                                  'error',
                              onTap: () {},
                            ),
                          );
                        }

                        return SliverList.separated(
                          itemBuilder:
                              (context, i) => GestureDetector(
                                onTap: () {
                                  context.push(
                                    OrderPaths.orderDetailswithid(
                                      id: allData[i].id,
                                    ),
                                  );
                                },
                                child: TodayScheduleCard(item: allData[i]),
                              ),
                          separatorBuilder:
                              (context, _) => SizedBox(height: UI.spacing.sm),
                          itemCount: allData.length,
                        );
                      },
                    ),
                  ),
                ],
              ),
              withBackgroundGradient: true,
            ),
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _buildSectionTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: UI.spacing.xl,
          horizontal: UI.spacing.lg,
        ),
        child: BlocBuilder<OrderCubit, BaseState<OrderState>>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.h4(context.orderTr.title.todaySchadule),
                UIText.bodySmall(
                  '${state.data?.todaySchaduleOrder.length ?? 0} pickups',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
