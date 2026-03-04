import 'dart:developer';
import 'package:authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/di/di_container.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:orders/src/presentation/widget/no_order_found_widget.dart';
import 'package:orders/src/presentation/widget/order_app_bar.dart';
import 'package:orders/src/presentation/widget/order_error_widgert.dart';
import 'package:orders/src/presentation/widget/order_shimmer_loading.dart';
import 'package:orders/src/presentation/widget/orders_list.dart';
import 'package:orders/src/presentation/widget/shimmer_order_card.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:orders/src/presentation/widget/card_status_order_widget.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class MyOrderScreen extends StatefulWidget {
  MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late final OrderCubit _orderCubit;

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _orderCubit = diContainerOrder<OrderCubit>();
    // _orderCubit = OrderCubit(  getDetailsOrderUseCase:diContainerOrder.get<GetDetailsBookingUseCase >() , cancelOrderUseCase: diContainerOrder.get<CancelOrderUseCase >(), getOrderUseCase: diContainerOrder<GetOrderDetailsUseCase >());
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    final screenWidth = MediaQuery.sizeOf(context).height;
    final tabs = [
      FilterTabContent(text: 'in progress', iconPath: ''),
      FilterTabContent(text: 'scheduled', iconPath: ''),
      FilterTabContent(text: 'completed', iconPath: ''),
    ];
    return BlocProvider(
      create: (context) => _orderCubit..getOrders(FilterOrder.all),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: UIBackground(
              child: RefreshIndicator(
                color: UIColor.babyBlue,
                onRefresh: () async {
                  _orderCubit.getOrders(FilterOrder.all);
                },
                child: NestedScrollView(
                  controller: ScrollController(),
                  headerSliverBuilder:
                      (context, innerBoxIsScrolled) => [
                        const OrderAppBar(),
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _FilterTabBarHeaderDelegate(
                            child: UIFilterTabBar(
                              tabs: tabs,
                              package: 'my order',
                              tabController: _tabController,
                            ),
                          ),
                        ),
                      ],
                  body: BlocBuilder<OrderCubit, BaseState<OrderState>>(
                    builder: (context, state) {
                      if (state.status == BaseCubitStatus.loading) {
                        return Center(child: OrdersShimmerLoadingWidget());
                      }

                      if (state.status == BaseCubitStatus.error) {
                        return OrdersErrorWidget(
                          message: state.error!.message,
                          onTap: () async {
                            print('object');
                            _orderCubit.getOrders(FilterOrder.all);
                          },
                        );
                      }
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          OrderList(orders: state.data?.inProcessOrder ?? []),
                          OrderList(orders: state.data?.schaduledOrder ?? []),
                          OrderList(orders: state.data?.completedOrder ?? []),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _FilterTabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  _FilterTabBarHeaderDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(color: Colors.transparent, child: child);
  }

  @override
  bool shouldRebuild(covariant _FilterTabBarHeaderDelegate oldDelegate) {
    return false;
  }
}
