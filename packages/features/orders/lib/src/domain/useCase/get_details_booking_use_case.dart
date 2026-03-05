import 'package:injectable/injectable.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/util.dart';
@injectable
class GetDetailsBookingUseCase
    extends BaseUseCase<BookingDetailseModelResponse> {
  GetDetailsBookingUseCase(this._repo, { @factoryParam required this.id});
  late final OrdersRepository _repo;
  final int id;
  @override
  Future<Result<BookingDetailseModelResponse, APIException>> call() async {
    return await _repo.getOrderDetails(id);
  }
}
