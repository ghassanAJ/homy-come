import 'package:api_client/api_client.dart';
import 'package:booking/booking.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'booking_api.g.dart';

// ─────────────────────────────────────────────────────────────
// ENDPOINTS
// ─────────────────────────────────────────────────────────────

class BookingAPIEndpoints {
  static const String serviceDetails = '/api/services/{id}';
  static const String createBooking = '/api/bookings';

  static const String getProviders = '/api/providers';
  static const String getAvailableDays = '/api/available-days';
  static const String getTimeSlots = '/api/time-slots';
}

// ─────────────────────────────────────────────────────────────
// API
// ─────────────────────────────────────────────────────────────

@injectable
@RestApi()
abstract class BookingAPI {
  @factoryMethod
  factory BookingAPI(@Named('defaultDio') Dio dio) = _BookingAPI;

  // ── Service Details ─────────────────────────────────────────

  @GET(BookingAPIEndpoints.serviceDetails)
  Future<APIResponse<ServiceDetailsResponseModel>> getServiceDetails(
    @Path('id') String serviceId, {
    @Queries() Map<String, dynamic>? queryParameters,
  });

  // ── Create Booking ──────────────────────────────────────────

  @POST(BookingAPIEndpoints.createBooking)
  Future<APIResponse<CreateBookingResponseModel>> createBooking(
    @Body() CreateBookingRequestModel request,
  );

  // ── Providers ───────────────────────────────────────────────

  @GET(BookingAPIEndpoints.getProviders)
  Future<APIResponse<List<ProviderModel>>> getProviders({
    @Query('service_id') required String serviceId,
    @Query('date') String? date, // optional filtering
  });

  // ── Available Days ──────────────────────────────────────────

  @GET(BookingAPIEndpoints.getAvailableDays)
  Future<APIResponse<List<DayModel>>> getAvailableDays({
    @Query('service_id') required String serviceId,
  });

  // ── Time Slots ──────────────────────────────────────────────

  @GET(BookingAPIEndpoints.getTimeSlots)
  Future<APIResponse<List<TimeSlotModel>>> getTimeSlots({
    @Query('service_id') required String serviceId,
    @Query('date') required String date, // ISO format
    @Query('provider_id') String? providerId,
  });
}
