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

class GetProvidersUseCase extends BaseUseCase<List<ProviderModel>> {
  GetProvidersUseCase(this._repository, this.serviceId);

  final BookingRepository _repository;
  final String serviceId;

  @override
  Future<Result<List<ProviderModel>, APIException>> call() {
    return _repository.getProviders(serviceId);
  }
}

class GetAvailableDaysUseCase extends BaseUseCase<List<DayModel>> {
  GetAvailableDaysUseCase(this._repository, this.serviceId);

  final BookingRepository _repository;
  final String serviceId;

  @override
  Future<Result<List<DayModel>, APIException>> call() {
    return _repository.getAvailableDays(serviceId);
  }
}

class GetTimeSlotsUseCase extends BaseUseCase<List<TimeSlotModel>> {
  GetTimeSlotsUseCase(this._repository, this.serviceId, this.date);

  final BookingRepository _repository;
  final String serviceId;
  final DateTime date;

  @override
  Future<Result<List<TimeSlotModel>, APIException>> call() {
    return _repository.getTimeSlots(serviceId: serviceId, date: date);
  }
}
