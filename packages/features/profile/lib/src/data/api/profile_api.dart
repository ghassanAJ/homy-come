import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/about_app_model.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/data/model/res/terms_and_condition_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

class ProfileAPIEndpoints {
  static const String aboutApp = '/api/v1/about-us';
  static const String termsAndCondition = '/api/v1/terms-and-conditions';
  static const String performance = '/api/v1/driver/profile/performance';
  static const String providerRatingDistribution =
      '/api/v1/provider/profile/rating-distribution';
  static const String providerReviews = '/api/v1/provider/profile/reviews';
}

@injectable
@RestApi()
abstract class ProfileAPI {
  @factoryMethod
  factory ProfileAPI(Dio dio) = _ProfileAPI;

  @GET(ProfileAPIEndpoints.aboutApp)
  Future<APIResponse<AboutAppModel>> getAboutApp();

  @GET(ProfileAPIEndpoints.termsAndCondition)
  Future<APIResponse<TermsAndConditionModel>> getTermsAndCondition();

  @GET(ProfileAPIEndpoints.performance)
  Future<APIResponse<DriverPerformanceModel>> getDriverPerformance();

  @GET(ProfileAPIEndpoints.providerReviews)
  Future<APIResponse<List<ReviewModel>>> getProviderReviews();
}
