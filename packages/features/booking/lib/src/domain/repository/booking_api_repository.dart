import 'package:api_client/api_client.dart';
import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:util/util.dart';

abstract class BookingRepository {
  Future<Result<ServiceDetailsResponseModel, APIException>> getServiceDetails(
    GetServiceDetailsRequestModel request,
  );

  Future<Result<CreateBookingResponseModel, APIException>> createBooking(
    CreateBookingRequestModel request,
  );
  Future<Result<List<ProviderModel>, APIException>> getProviders(
    String serviceId,
  );

  Future<Result<List<DayModel>, APIException>> getAvailableDays(
    String serviceId,
  );

  Future<Result<List<TimeSlotModel>, APIException>> getTimeSlots({
    required String serviceId,
    required DateTime date,
    String? providerId,
  });
}

@Injectable(as: BookingRepository, env: ['prod', 'dev'])
class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl(this._bookingAPI);

  final BookingAPI _bookingAPI;

  @override
  Future<Result<ServiceDetailsResponseModel, APIException>> getServiceDetails(
    GetServiceDetailsRequestModel request,
  ) {
    return _bookingAPI
        .getServiceDetails(
          request.serviceId,
          queryParameters: request.toQueryParameters(),
        )
        .toResult();
  }

  @override
  Future<Result<CreateBookingResponseModel, APIException>> createBooking(
    CreateBookingRequestModel request,
  ) {
    return _bookingAPI.createBooking(request).toResult();
  }

  @override
  Future<Result<List<DayModel>, APIException>> getAvailableDays(
    String serviceId,
  ) {
    return _bookingAPI.getAvailableDays(serviceId: serviceId).toResult();
  }

  @override
  Future<Result<List<ProviderModel>, APIException>> getProviders(
    String serviceId,
  ) {
    return _bookingAPI
        .getProviders(
          serviceId: serviceId,
          // date: request.scheduledAt.toIso8601String(),??TODO
        )
        .toResult();
  }

  @override
  Future<Result<List<TimeSlotModel>, APIException>> getTimeSlots({
    required String serviceId,
    required DateTime date,
    String? providerId,
  }) {
    return _bookingAPI
        .getTimeSlots(
          serviceId: serviceId,
          date: date.toIso8601String(),
          providerId: providerId,
        )
        .toResult();
  }
}
