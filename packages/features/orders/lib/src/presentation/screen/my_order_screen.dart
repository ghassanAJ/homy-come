import 'dart:developer';
import 'package:authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/di/di_container.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:profile/profile.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders/src/presentation/widget/card_status_order_widget.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:bloc/bloc.dart';

class MyOrderScreen extends StatefulWidget {
  MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  late final OrderCubit _orderCubit;
  // int _selectedIndex = 0;
  ValueNotifier<int> _selectedIndexNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _orderCubit = OrderCubit(diContainerOrder.get<OrdersRepository>());
    _orderCubit.getDataOrder();
    // _cubit = ServiceDetailsCubit(diContainer.get<BookingRepository>());
    // _cubit.fetchServiceDetails(serviceId: 'home-deep-cleaning');
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return BlocProvider(
      create: (context) => _orderCubit,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: UIBackground(
              child: BlocBuilder<
                OrderCubit,
                BaseState<List<BookingModelResponse>>
              >(
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      OrderAppBar(),
                      SliverToBoxAdapter(
                        child: SizedBox(height: UI.spacing.md),
                      ),

                      SliverToBoxAdapter(
                        child: UIchipsBar(
                          onSelect: (value) {
                            // log('Selected: $value');
                            // setState(() {
                            // _selectedIndex = value;
                            _selectedIndexNotifier.value = value;
                            // }
                            // );
                          },
                          firstLabel: tr.labels.all,
                          label: [
                            tr.title.inProgess,
                            tr.title.scheduled,
                            tr.title.completed,
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: UI.spacing.md),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: UI.spacing.lg,
                          vertical: UI.spacing.md,
                        ),
                        sliver: BlocBuilder<
                          OrderCubit,
                          BaseState<List<BookingModelResponse>>
                        >(
                          builder: (context, state1) {
                            if (state1.status == BaseCubitStatus.loading) {
                              return SliverToBoxAdapter(
                                child: Column(
                                  children: [
                                    ...List.generate(3, (i) {
                                      return Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: UI.spacing.md),
                                        child: ShimmerCard(),
                                      );
                                    }),
                                  ],
                                ),
                
                              );
                            }
                            if (state1.status == BaseCubitStatus.error)
                              return Center(
                                child: Text(state1.error?.message ?? 'Error'),
                              );

                            return ValueListenableBuilder(
                              valueListenable: _selectedIndexNotifier,
                              builder: (
                                BuildContext context,
                                value,
                                Widget? child,
                              ) {
                                List<BookingModelResponse> filteredList;

                                final allOrders = state1.data ?? [];
                                filteredList = _FilterOrder(value, allOrders);

                                return SliverList.separated(
                                  itemBuilder: (context, i) {
                                    return OrderStatusCardContent(
                                      item: filteredList[i],
                                    );
                                  },
                                  separatorBuilder:
                                      (context, _) =>
                                          SizedBox(height: UI.spacing.md),
                                  itemCount: filteredList.length,
                                );
                              },
                            );
                          },
                        ),
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

  List<BookingModelResponse> _FilterOrder(
    int index,
    List<BookingModelResponse> allOrder,
  ) {
    if (index == 1) {
      return allOrder.where((e) => e.status == 'in_progress').toList();
    } else if (index == 2) {
      return allOrder.where((e) => e.status == 'scheduled').toList();
    } else if (index == 3) {
      return allOrder.where((e) => e.status == 'completed').toList();
    } else {
      return allOrder;
    }
  }
}

class OrderAppBar extends StatelessWidget {
  const OrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return UISliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Padding(
          padding: EdgeInsets.only(left: UI.spacing.xl, top: UI.spacing.md),
          child: Column(children: [Divider(height: 4, color: UIColor.divider)]),
        ),
      ),
      variant: UISliverAppBarVariant.transparent,
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: BackButtonAppBar(),
        ),
      ),
      centerTitle: true,
      titleWidget: UIText.h4(context.orderTr.title.myOrder),

      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: UI.spacing.lg),
            padding: EdgeInsets.symmetric(
              horizontal: UI.spacing.sm,
              vertical: UI.spacing.xxs,
            ),
            // width: 50,
            height: UI.sizes.iconLg,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(UI.radius.sm),
              color: UIColor.neutral100,
            ),
            child: UISvg(Assets.icons.notification, color: UIColor.black),
          ),
        ),
      ],
    );
  }
}
