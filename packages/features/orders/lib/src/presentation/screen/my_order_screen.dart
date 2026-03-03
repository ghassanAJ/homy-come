import 'dart:developer';
import 'package:authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/src/cubit/order_cubit.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/di/di_container.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:orders/src/presentation/widget/no_order_found_widget.dart';
import 'package:orders/src/presentation/widget/order_app_bar.dart';
import 'package:orders/src/presentation/widget/shimmer_order_card.dart';
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

  
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    final screenWidth = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => _orderCubit..getOrders(FilterOrder.all),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: UIBackground(
              child: RefreshIndicator(color: UIColor.babyBlue,
                onRefresh: () async {
                  _orderCubit.getOrders(FilterOrder.all);
                },
                child: CustomScrollView(
                  slivers: [
                    OrderAppBar(),
                    SliverToBoxAdapter(child: SizedBox(height: UI.spacing.md)),

                    SliverToBoxAdapter(
                      child: UIchipsBar(
                        onSelect: (value) {
                          _selectedIndexNotifier.value = value;
                        },
                        firstLabel: tr.labels.all,
                        label: [
                          tr.title.inProgess,
                          tr.title.scheduled,
                          tr.title.completed,
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: UI.spacing.md)),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: UI.spacing.sm,
                        vertical: UI.spacing.md,
                      ),
                      sliver: BlocBuilder<OrderCubit, BaseState<OrderState>>(
                        builder: (context, state1) {
                          if (state1.status == BaseCubitStatus.loading) {
                            return SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  ...List.generate(3, (i) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: UI.spacing.md,
                                      ),
                                      child: ShimmerOrderCard(),
                                    );
                                  }),
                                ],
                              ),
                            );
                          }
                          if (state1.status == BaseCubitStatus.error)
                            return SliverToBoxAdapter(
                              child: Center(
                                child: Text(state1.error?.message ?? 'Error'),
                              ),
                            );
                      
                          return ValueListenableBuilder(
                            valueListenable: _selectedIndexNotifier,
                            builder: (
                              BuildContext context,
                              value,
                              Widget? child,
                            ) {
                              List<BookingModelResponse> filteredList;
                              if (value == 0) {
                                filteredList = state1.data?.allOrder ?? [];
                              } else if (value == 1) {
                                filteredList = state1.data?.inProcessOrder ?? [];
                              } else if (value == 2) {
                                filteredList = state1.data?.schaduledOrder ?? [];
                              } else {
                                filteredList = state1.data?.completedOrder ?? [];
                              }
                         
                              if (filteredList.isEmpty)
                                return SliverToBoxAdapter(
                                  child: NoOrderFoundWidget(),
                                );
                      
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
                  // );
                  // },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}

