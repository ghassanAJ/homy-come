import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

class ProfileAPIEndpoints {
  static const String performance = '/api/v1/driver/profile/performance';
}

@injectable
@RestApi()
abstract class ProfileAPI {
  @factoryMethod
  factory ProfileAPI(Dio dio) = _ProfileAPI;

  @GET(ProfileAPIEndpoints.performance)
  Future<APIResponse<DriverPerformanceModel>> getDriverPerformance();
}
