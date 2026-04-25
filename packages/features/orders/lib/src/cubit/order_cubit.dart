import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/domain/useCase/cancel_order_use_case.dart';
import 'package:orders/src/domain/useCase/get_details_booking_use_case.dart';
import 'package:orders/src/domain/useCase/get_order_details_by_Id_use_case.dart';
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart';
import 'package:orders/src/domain/useCase/get_today_schedule_use_case.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:util/util.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  OrderCubit(super.initialState);

  Future<void> getOrders({
    FilterOrder filter = FilterOrder.all,
    int selectedDayIndex = 1,
    String month = '',
  }) async {
    emit(
      state.copyWith(
        status: BaseCubitStatus.loading,
        isOrdersLoading: true,
        selectedDayIndex: selectedDayIndex,
      ),
    );
    final result =
        await diContainerOrder<GetOrderDetailsUseCase>(param1: filter)();
    result.fold(
      (orders) {
        final completed =
            orders
                .where((item) => item.status == OrderStatus.completed)
                .toList();

        final inProgress =
            orders
                .where((item) => item.status == OrderStatus.inProgress)
                .toList();

        final scheduled =
            orders
                .where((item) => item.status == OrderStatus.scheduled)
                .toList();

        emit(
          state.copyWith(
            // data: (state.data ?? OrderState()).copyWith(
            allOrder: orders,
            completedOrder: completed,
            inProcessOrder: inProgress,
            schaduledOrder: scheduled,
            // ),
            isOrdersLoading: false,
            status: BaseCubitStatus.success,
          ),
        );
      },
      (error) {
        emit(state.copyWith(error: error, isOrdersLoading: false));
      },
    );
  }

  void getDetailsOrders(int id) async {
    emit(state.copyWith(status: BaseCubitStatus.loading));
    // final result = await GetDetailsBookingUseCase(repo, id: id)();
    final result =
        await diContainerOrder<GetDetailsBookingUseCase>(param1: id)();
    result.fold(
      (data) {
        emit(
          state.copyWith(orderDetailse: data, status: BaseCubitStatus.success),
        );
      },
      (error) {
        emit(state.copyWith(error: error));
      },
    );
  }

  void changeOrderStatus(int id, OrderStatus status, {String? reason}) async {
    emit(state.copyWith(isOrderStatusChangeLoading: true));

    final result =
        await diContainerOrder<CancelOrderUseCase>(
          param1: id,
          param2: 'reason',
        )();
    result.fold(
      (isSucces) {
        if (isSucces) {
          log('succss');
          final all = List<TodaySchaduleModelResponse>.from(
            state.todaySchaduleOrder,
          );
          final index = all.indexWhere((item) {
            return item.id == id;
          });
          if (index == -1) return;
          all.removeAt(index);
          emit(
            state.copyWith(
              todaySchaduleOrder: all,
              isOrderStatusChangeLoading: false,
              isOrderStatusChanged: true,
            ),
          );
        }
      },
      (failure) {
        emit(
          state.copyWith(
            changeOrderError: failure.message,
            isOrderStatusChangeLoading: false,
          ),
        );
      },
    );
  }

  void getTodayScheduleOrders() async {
    emit(
      state.copyWith(
        isLoadingTodayScheduleOrder: true,
        fetchTodayScheduleError: null,
      ),
    );
    var result = await diContainerOrder<GetTodayScheduleUseCase>()();
    result.fold(
      (data) {
        log(data.length.toString());
        emit(
          state.copyWith(
            todaySchaduleOrder: data,
            isLoadingTodayScheduleOrder: false,
            fetchTodayScheduleError: null,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            fetchTodayScheduleError: error.message,
            isLoadingTodayScheduleOrder: false,
          ),
        );
      },
    );
  }

  void getOrderDetailsById(int id) async {
    emit(state.copyWith(isLoadingOrderDetailsById: true));
    var result =
        await diContainerOrder<GetOrderDetailsByIdUseCase>(param1: id)();
    result.fold(
      (data) {
        emit(
          state.copyWith(
            orderDetailsById: data,
            isLoadingOrderDetailsById: false,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            fetchOrderDetailsError: error.message,
            isLoadingOrderDetailsById: false,
          ),
        );
      },
    );
  }
}
