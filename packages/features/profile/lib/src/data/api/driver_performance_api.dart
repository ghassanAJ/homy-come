import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:retrofit/retrofit.dart';

part 'driver_performance_api.g.dart';

class DriverPerformanceAPIEndpoints {
  static const String performance = '/api/v1/driver/profile/performance';
}

@injectable
@RestApi()
abstract class DriverPerformanceAPI {
  @factoryMethod
  factory DriverPerformanceAPI(Dio dio) = _DriverPerformanceAPI;

  @GET(DriverPerformanceAPIEndpoints.performance)
  Future<APIResponse<DriverPerformanceModel>> getDriverPerformance();
}
