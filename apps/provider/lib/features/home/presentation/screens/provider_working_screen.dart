import 'package:booking/booking.dart';
import 'package:equatable/equatable.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/presentation/widget/order_shimmer_loading.dart';
import 'package:orders/src/presentation/widget/orders_list.dart';

class ProviderWorkingScreen extends StatefulWidget {
  const ProviderWorkingScreen({super.key});

  @override
  State<ProviderWorkingScreen> createState() => _ProviderWorkingScreenState();
}

class _ProviderWorkingScreenState extends State<ProviderWorkingScreen> {
  late final OrderCubit _orderCubit;
  @override
  void initState() {
    _orderCubit = OrderCubit(OrderState())..getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _orderCubit,
      child: OrderLocalizationScope(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<OrderCubit>(context).getTodayScheduleOrders();
          },
          child: DefaultTabController(
            length: 3,
            child: UIScaffold(
              appBar: UIAppBar(title: 'My Work'),
              body: BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      DateSection(
                        onSelectedMonth: (scheduledAt) {
                          context.read<OrderCubit>().getOrders();
                        },
                        availableDays: [
                          DayModel(
                            day: '12',
                            weekDay: 'Sun',
                            date: DateTime.now(),
                          ),
                          DayModel(
                            day: '13',
                            weekDay: 'Mon',
                            date: DateTime.now(),
                          ),
                          DayModel(
                            day: '17',
                            weekDay: 'Tus',
                            date: DateTime.now(),
                          ),
                          DayModel(
                            day: '23',
                            weekDay: 'Wen',
                            date: DateTime.now(),
                          ),
                          DayModel(
                            day: '24',
                            weekDay: 'Thu',
                            date: DateTime.now(),
                          ),
                          DayModel(
                            day: '26',
                            weekDay: 'Fri',
                            date: DateTime.now(),
                          ),
                          DayModel(
                            day: '28',
                            weekDay: 'Sut',
                            date: DateTime.now(),
                          ),
                        ],
                        scheduledAt: DateTime.now(),
                        selectedDayIndex: state.selectedDayIndex,
                        onSelectedDay: (index) {
                          context.read<OrderCubit>().getOrders(
                            selectedDayIndex: index,
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      UIFilterTabBar(
                        tabs: [
                          FilterTabContent(text: 'Scheduled', iconPath: ''),
                          FilterTabContent(text: 'In Progress', iconPath: ''),
                          FilterTabContent(text: 'Completed', iconPath: ''),
                        ],
                        package: 'my order',
                      ),
                      if (state.isOrdersLoading)
                        Expanded(child: OrdersShimmerLoadingWidget()),
                      if (state.allOrder.isNotEmpty && !state.isOrdersLoading)
                        Expanded(
                          child: TabBarView(
                            controller: DefaultTabController.of(context),
                            children: [
                              OrderList(orders: state.schaduledOrder),
                              OrderList(orders: state.inProcessOrder),
                              OrderList(orders: state.completedOrder),
                            ],
                          ),
                        ),

                      // Expanded(
                      //   child: BlocProvider(
                      //     create: (context) => _orderCubit,
                      //     child: BlocBuilder<OrderCubit, OrderState>(
                      //       builder: (context, state) {
                      //         if (state.isLoadingTodayScheduleOrder) {
                      //           return Center(
                      //             child: CircularProgressIndicator.adaptive(),
                      //           );
                      //         } else if (state.error != null) {
                      //           return SliverToBoxAdapter(
                      //             child: OrdersErrorWidget(
                      //               message: state.error?.message ?? 'error',
                      //               onTap: () {},
                      //             ),
                      //           );
                      //         }
                      //         if (state.allOrder.isEmpty) {
                      //           return OrderEmptyWidget();
                      //         }

                      //         return Padding(
                      //           padding: EdgeInsets.symmetric(
                      //             horizontal: UI.spacing.lg,
                      //           ),
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               SizedBox(height: 14),

                      //               UIText.caption(
                      //                 '${state.allOrder.length} pickups',
                      //                 color: UIColor.neutral400,
                      //               ),

                      //               SizedBox(height: 14),
                      //               Expanded(
                      //                 child: ListView.separated(
                      //                   padding: EdgeInsets.only(top: 0, bottom: 150),
                      //                   itemBuilder:
                      //                       (context, i) => GestureDetector(
                      //                         onTap: () {
                      //                           context.push(
                      //                             OrderPaths.orderDetailswithid(
                      //                               id: state.allOrder[i].id,
                      //                             ),
                      //                             extra: context.read<OrderCubit>(),
                      //                           );
                      //                         },
                      //                         child: OrderStatusCardContent(
                      //                           item: state.allOrder[i],
                      //                         ),
                      //                       ),
                      //                   separatorBuilder:
                      //                       (context, _) =>
                      //                           SizedBox(height: UI.spacing.sm),
                      //                   itemCount: state.allOrder.length,
                      //                 ),
                      //               ),

                      //               // SizedBox(height: 150),
                      //             ],
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
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
