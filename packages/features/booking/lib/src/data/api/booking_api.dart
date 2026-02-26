import 'package:api_client/api_client.dart';
import 'package:booking/src/data/model/res/service_details_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class BookingAPIEndpoints {
  static const String serviceDetails = '/api/v1/user/services/{id}/details';
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
      (json) => ServiceDetailsResponseModel.fromJson(json! as Map<String, dynamic>),
    );
  }
}
