import 'dart:io';

import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:util/util.dart';

class GetOrderDetailsUseCase extends BaseUseCase<List<BookingModelResponse>> {
  GetOrderDetailsUseCase(this._repo, {required this.status});
  late final OrdersRepository _repo;
  final FilterOrder status;
  @override
  Future<Result<List<BookingModelResponse>, APIException>> call() {
    return _repo.getMyOrder(status);
  }
}


