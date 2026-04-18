import 'package:booking/booking.dart';
import 'package:util/util.dart';

class CreateBookingUseCase extends BaseUseCase<CreateBookingResponseModel> {
  CreateBookingUseCase(this._repository, this._request);

  final BookingRepository _repository;
  final CreateBookingRequestModel _request;

  @override
  Future<Result<CreateBookingResponseModel, APIException>> call() {
    return _repository.createBooking(_request);
  }
}
