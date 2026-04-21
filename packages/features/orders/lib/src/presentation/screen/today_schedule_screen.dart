import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/presentation/widget/today_schecule_card.dart';
import 'package:user/features/home/presentation/widgets/home/home_header.dart';

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
    return OrderLocalizationScope(
      child: BlocProvider(
        create: (context) => _orderCubit..getTodayScheduleOrders(),
        child: Builder(
          builder: (context) {
            final state = _orderCubit.state;
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<OrderCubit>(context).getTodayScheduleOrders();
              },
              child: UIScaffold(
                appBar: UIAppBar(
                  titleWidget: HomeHeader(),
                  automaticallyImplyLeading: false,
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      UIText.bodyLarge(
                        context.orderTr.title.todaySchadule,
                        fontWeight: FontWeight.bold,
                      ),
                      UIText.bodySmall(
                        '${state.data?.todaySchaduleOrder.length} pickups',
                      ),
                      SizedBox(height: 24),

                      Expanded(
                        child: BlocSelector<
                          OrderCubit,
                          BaseState<OrderState>,
                          TodayScheduleViewState
                        >(
                          builder: (context, state) {
                            List<TodaySchaduleModelResponse> allData =
                                state.orders;

                            // if (state.isLoading) {
                            //   return SliverToBoxAdapter(
                            //     child: ShimmerScheduleOrderCard(),
                            //   );
                            // } else if (state.error != null) {
                            //   return SliverToBoxAdapter(
                            //     child: OrdersErrorWidget(
                            //       message: state.error ?? 'error',
                            //       onTap: () {},
                            //     ),
                            //   );
                            // }

                            return GradientFadeStack(
                              fadeTop: false,
                              fadeBottom: true,
                              fadeLeft: false,
                              fadeRight: false,
                              width: 60,
                              child: ListView.separated(
                                padding: EdgeInsets.only(top: 12, bottom: 150),
                                itemBuilder:
                                    (context, i) => GestureDetector(
                                      onTap: () {
                                        context.push(
                                          OrderPaths.orderDetailswithid(
                                            id: allData[i].id,
                                          ),
                                        );
                                      },
                                      child: TodayScheduleCard(
                                        item: allData[i],
                                      ),
                                    ),
                                separatorBuilder:
                                    (context, _) =>
                                        SizedBox(height: UI.spacing.sm),
                                itemCount: allData.length,
                              ),
                            );
                          },
                          selector: (state) {
                            var data = state.data ?? OrderState();
                            return TodayScheduleViewState(
                              orders: data.todaySchaduleOrder,
                              isLoading: data.isLoadingTodayScheduleOrder,
                              error: data.fetchTodayScheduleError,
                            );
                          },
                        ),
                      ),
                      // SizedBox(height: 150),
                    ],
                  ),
                ),
                withBackgroundGradient: true,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Padding(
      padding: EdgeInsets.all(UI.spacing.lg),
      child: BlocSelector<
        OrderCubit,
        BaseState<OrderState>,
        List<TodaySchaduleModelResponse>
      >(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          );
        },
        selector: (state) => state.data?.todaySchaduleOrder ?? [],
      ),
    );
  }
}

class TodayScheduleViewState extends Equatable {
  final List<TodaySchaduleModelResponse> orders;
  final bool isLoading;
  final String? error;

  const TodayScheduleViewState({
    this.orders = const [],
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [orders, isLoading, error];
}
