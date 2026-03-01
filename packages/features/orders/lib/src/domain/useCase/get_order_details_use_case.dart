import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/util.dart';

class GetOrderDetailsUseCase extends BaseUseCase<List<BookingModelResponse>> {
  GetOrderDetailsUseCase(this._repo);
  late final OrdersRepository _repo;
  @override
  Future<Result<List<BookingModelResponse>, APIException>> call() {
    return _repo.getMyOrder();
  }
}
