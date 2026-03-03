import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:orders/src/cubit/order_state.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders/src/domain/useCase/cancel_order_use_case.dart';
import 'package:orders/src/domain/useCase/get_details_booking_use_case.dart';
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
// import 'package:bloc/bloc.dart';
import 'package:util/util.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/src/base_cubit/base_state.dart';



@injectable
class OrderCubit extends BaseScreenCubit<OrderState> {
  OrderCubit(this.repo);
  final OrdersRepository repo;

  Future<void> getOrders(FilterOrder filter) async {
    emit(state.copyWith(status: BaseCubitStatus.loading));
    final result =
        await GetOrderDetailsUseCase(repo, status: FilterOrder.all)();
    //  emit(state.loading());
    result.fold(
      (orders) {
        log('orders: ${orders.length}');
        final completed = orders.where((e) => e.status == 'completed').toList();

        final inProgress =
            orders.where((e) => e.status == 'in_progress').toList();

        final scheduled = orders.where((e) => e.status == 'scheduled').toList();

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
    final result = await GetDetailsBookingUseCase(repo, id: id)();
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
    List<BookingModelResponse> all = [];
    emit(
      state.copyWith(data: state.data?.copyWith(isCancelOrderLoading: true)),
    );

    final result =
        await CancelOrderUseCase(id: id, repo: repo, reason: reason)();
    result.fold(
      (isSucces) {
        if (isSucces) {
          if (status == FilterOrder.in_progress) {
            all = List.from((state.data ?? OrderState()).inProcessOrder);
            int index = all.indexWhere((item) => item.id == id);
            all.removeAt(index);
            emit(
              state.copyWith(
                data: state.data?.copyWith(
                  inProcessOrder: all,
                  isCancelOrderLoading: false,
                  isOrderCancelled: true,
                ),
              ),
            );
          } else if (status == FilterOrder.scheduled) {
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

