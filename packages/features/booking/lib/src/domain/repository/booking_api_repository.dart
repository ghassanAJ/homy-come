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
          serviceId: request.serviceId,
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
}
