import 'package:api_client/api_client.dart';
import 'package:booking/src/data/model/req/create_booking_request_model.dart';
import 'package:booking/src/data/model/res/create_booking_response_model.dart';
import 'package:booking/src/data/model/res/service_details_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class BookingAPIEndpoints {
  static const String serviceDetails = '/api/services/{id}';
  static const String createBooking = '/bookings';
}

@injectable
class BookingAPI {
  BookingAPI(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<APIResponse<ServiceDetailsResponseModel>> getServiceDetails({
    required String serviceId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      BookingAPIEndpoints.serviceDetails.replaceFirst('{id}', serviceId),
      queryParameters: queryParameters,
    );

    final responseJson = response.data ?? <String, dynamic>{};

    return APIResponse.fromJson(
      responseJson,
      (json) =>
          ServiceDetailsResponseModel.fromJson(json! as Map<String, dynamic>),
    );
  }

  Future<APIResponse<CreateBookingResponseModel>> createBooking(
    CreateBookingRequestModel request,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      BookingAPIEndpoints.createBooking,
      data: request.toJson(),
    );

    final responseJson = response.data ?? <String, dynamic>{};

    return APIResponse.fromJson(
      responseJson,
      (json) =>
          CreateBookingResponseModel.fromJson(json! as Map<String, dynamic>),
    );
  }
}
