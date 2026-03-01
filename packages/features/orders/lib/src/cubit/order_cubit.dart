import 'package:injectable/injectable.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart';
// import 'package:bloc/bloc.dart';
import 'package:util/util.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/src/base_cubit/base_state.dart';

part 'order_cubit.freezed.dart';

@injectable
class OrderCubit extends BaseScreenCubit<List<BookingModelResponse>> {
  OrderCubit(this.repo);
  //  : super(OrderState());
  final OrdersRepository repo;

  void getDataOrder() async {
   return fetchData(useCase: GetOrderDetailsUseCase(repo));

  }
}

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({@Default([]) List<BookingModelResponse> allOrder}) =
      _OrderState;
}
