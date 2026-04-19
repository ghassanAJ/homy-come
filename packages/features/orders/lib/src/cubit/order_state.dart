import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
part 'order_state.freezed.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    @Default([]) List<BookingModelResponse> allOrder,
    @Default([]) List<BookingModelResponse> inProcessOrder,
    @Default([]) List<BookingModelResponse> completedOrder,
    @Default([]) List<BookingModelResponse> schaduledOrder,
    @Default([]) List<TodaySchaduleModelResponse> todaySchaduleOrder,
    String? fetchTodayScheduleError,
    @Default(false) isLoadingTodayScheduleOrder,
    TodaySchaduleModelResponse? orderDetailsById,
    @Default(false) isLoadingOrderDetailsById,
    String? fetchOrderDetailsError,
    BookingDetailseModelResponse? orderDetailse,
    @Default(false) bool isOrderCancelled,
    @Default(false) bool isCancelOrderLoading,
    String? cancelOrderError,
  }) = _OrderState;
}
