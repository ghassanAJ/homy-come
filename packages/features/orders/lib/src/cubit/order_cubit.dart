import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:orders/orders.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/domain/useCase/cancel_order_use_case.dart';
import 'package:orders/src/domain/useCase/get_details_booking_use_case.dart';
import 'package:orders/src/domain/useCase/get_order_details_by_Id_use_case.dart';
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart';
import 'package:orders/src/domain/useCase/get_today_schedule_use_case.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:util/util.dart';

@injectable
class OrderCubit extends BaseScreenCubit<OrderState> {
  OrderCubit(); //TODO : make cubit depend on useCases

  Future<void> getOrders(FilterOrder filter) async {
    emit(state.copyWith(status: BaseCubitStatus.loading));
    final result =
        await diContainerOrder<GetOrderDetailsUseCase>(param1: filter)();
    result.fold(
      (orders) {
        final completed =
            orders.where((item) => item.status == 'Completed').toList();

        final inProgress =
            orders.where((item) => item.status == 'In Progress').toList();

        final scheduled =
            orders.where((item) => item.status == 'Scheduled').toList();

        emit(
          state.copyWith(
            data: (state.data ?? OrderState()).copyWith(
              allOrder: orders,
              completedOrder: completed,
              inProcessOrder: inProgress,
              schaduledOrder: scheduled,
            ),
            status: BaseCubitStatus.success,
          ),
        );
      },
      (error) {
        emit(state.errorState(error));
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
          state.copyWith(
            data: state.data?.copyWith(orderDetailse: data),
            status: BaseCubitStatus.success,
          ),
        );
      },
      (error) {
        emit(state.copyWith(error: error));
      },
    );
  }

  void cancelOrder(int id, FilterOrder status, String reason) async {
    if (status == FilterOrder.scheduled) {
      List<BookingModelResponse> all = [];
      emit(
        state.copyWith(data: state.data?.copyWith(isCancelOrderLoading: true)),
      );

      final result =
          await diContainerOrder<CancelOrderUseCase>(
            param1: id,
            param2: reason,
          )();
      result.fold(
        (isSucces) {
          if (isSucces) {
            if (status == FilterOrder.scheduled) {
              all = List.from((state.data ?? OrderState()).schaduledOrder);
              int index = all.indexWhere((item) => item.id == id);
              all.removeAt(index);
              emit(
                state.copyWith(
                  data: state.data?.copyWith(
                    schaduledOrder: all,
                    isCancelOrderLoading: false,
                    isOrderCancelled: true,
                  ),
                ),
              );
            }
          }
        },
        (failure) {
          emit(
            state.copyWith(
              data: state.data?.copyWith(
                cancelOrderError: failure.message,
                isCancelOrderLoading: false,
              ),
            ),
          );
        },
      );
    }
  }

  void getTodayScheduleOrders() async {
    emit(
      state.copyWith(
        data: state.data?.copyWith(
          isLoadingTodayScheduleOrder: true,
          fetchTodayScheduleError: null,
        ),
      ),
    );
    var result = await diContainerOrder<GetTodayScheduleUseCase>()();
    result.fold(
      (data) {
        log(data.length.toString());
        emit(
          state.copyWith(
            data: (state.data ?? const OrderState()).copyWith(
              todaySchaduleOrder: data,
              isLoadingTodayScheduleOrder: false,
              fetchTodayScheduleError: null,
            ),
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            data: (state.data ?? const OrderState()).copyWith(
              fetchTodayScheduleError: error.message,
              isLoadingTodayScheduleOrder: false,
            ),
          ),
        );
      },
    );
  }

  void getOrderDetailsById(int id) async {
    final currentData = state.data ?? const OrderState();
    emit(
      state.copyWith(
        data: currentData.copyWith(isLoadingOrderDetailsById: true),
      ),
    );
    var result =
        await diContainerOrder<GetOrderDetailsByIdUseCase>(param1: id)();
    result.fold(
      (data) {
        emit(
          state.copyWith(
            data: currentData.copyWith(
              orderDetailsById: data,
              isLoadingOrderDetailsById: false,
            ),
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            data: currentData.copyWith(
              fetchOrderDetailsError: error.message,
              isLoadingOrderDetailsById: false,
            ),
          ),
        );
      },
    );
  }
}
