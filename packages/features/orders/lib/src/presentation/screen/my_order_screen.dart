import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/di/di_container.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:orders/src/presentation/widget/order_app_bar.dart';
import 'package:orders/src/presentation/widget/order_error_widgert.dart';
import 'package:orders/src/presentation/widget/order_shimmer_loading.dart';
import 'package:orders/src/presentation/widget/orders_list.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late final OrderCubit _orderCubit;
  late final ScrollController _scrollController;

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _orderCubit = diContainerOrder<OrderCubit>();

    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    final screenWidth = MediaQuery.sizeOf(context).height;
    final tabs = [
      FilterTabContent(text: tr.title.inProgess, iconPath: ''),
      FilterTabContent(text: tr.title.scheduled, iconPath: ''),
      FilterTabContent(text: tr.title.completed, iconPath: ''),
    ];
    return BlocProvider(
      create: (context) => _orderCubit..getOrders(FilterOrder.all),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: UIBackground(
              child: RefreshIndicator(
                color: UIColor.babyBlue,
                onRefresh: () async => _orderCubit.getOrders(FilterOrder.all),
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (context, innerBoxIsScrolled) => [
                        OrderAppBar(scrollController: _tabController),
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
    _scrollController.dispose();
    super.dispose();
  }
}
