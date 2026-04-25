import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/presentation/widget/order_error_widgert.dart';
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
    _orderCubit = OrderCubit(OrderState())..getTodayScheduleOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrderLocalizationScope(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<OrderCubit>(context).getTodayScheduleOrders();
        },
        child: UIScaffold(
          appBar: UIAppBar(
            titleWidget: HomeHeader(),
            automaticallyImplyLeading: false,
          ),
          body: BlocProvider(
            create: (context) => _orderCubit,
            child: BlocConsumer<OrderCubit, OrderState>(
              listenWhen:
                  (previous, current) =>
                      previous.todaySchaduleOrder.length !=
                      current.todaySchaduleOrder.length,
              //||
              //     previous.isOrderStatusChangeLoading !=
              //         current.isOrderStatusChangeLoading ||
              //     previous.isOrderStatusChanged !=
              //         current.isOrderStatusChanged,
              listener: (context, state) {
                if (state.isOrderStatusChangeLoading) {
                  DialogsManager.showLoading(context);
                }

                if (state.isOrderStatusChanged) {
                  DialogsManager.hideLoading(context);
                }
              },
              builder: (context, state) {
                if (state.isLoadingTodayScheduleOrder) {
                  return Center(child: CircularProgressIndicator.adaptive());
                } else if (state.error != null) {
                  return SliverToBoxAdapter(
                    child: OrdersErrorWidget(
                      message: state.error?.message ?? 'error',
                      onTap: () {},
                    ),
                  );
                }
                if (state.todaySchaduleOrder.isEmpty) {
                  return OrderEmptyWidget();
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 24),
                      UIText.bodyLarge(
                        context.orderTr.title.todaySchadule,
                        fontWeight: FontWeight.bold,
                      ),
                      UIText.caption(
                        '${state.todaySchaduleOrder.length} pickups',
                        color: UIColor.neutral400,
                      ),

                      SizedBox(height: 14),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.only(top: 0, bottom: 150),
                          itemBuilder:
                              (context, i) => GestureDetector(
                                onTap: () {
                                  context.push(
                                    OrderPaths.orderDetailswithid(
                                      id: state.todaySchaduleOrder[i].id,
                                    ),
                                    extra: context.read<OrderCubit>(),
                                  );
                                },
                                child: TodayScheduleCard(
                                  item: state.todaySchaduleOrder[i],
                                ),
                              ),
                          separatorBuilder:
                              (context, _) => SizedBox(height: UI.spacing.sm),
                          itemCount: state.todaySchaduleOrder.length,
                        ),
                      ),

                      // SizedBox(height: 150),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildSectionTitle() {
  //   return Padding(
  //     padding: EdgeInsets.all(UI.spacing.lg),
  //     child: BlocSelector<
  //       OrderCubit,
  //       BaseState<OrderState>,
  //       List<TodaySchaduleModelResponse>
  //     >(
  //       builder: (context, state) {
  //         return Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [],
  //         );
  //       },
  //       selector: (state) => state.data?.todaySchaduleOrder ?? [],
  //     ),
  //   );
  // }
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

class OrderEmptyWidget extends StatelessWidget {
  const OrderEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: UIText.bodyBold('No Orders for today'));
  }
}
