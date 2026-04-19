import 'package:booking/booking.dart';
import 'package:util/util.dart';

class GetServiceDetailsUseCase
    extends BaseUseCase<ServiceDetailsResponseModel> {
  GetServiceDetailsUseCase(this._repository, this._request);

  final BookingRepository _repository;
  final GetServiceDetailsRequestModel _request;

  @override
  Future<Result<ServiceDetailsResponseModel, APIException>> call() {
    return _repository.getServiceDetails(_request);
  }
}
