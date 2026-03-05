import 'package:api_client/api_client.dart';
import 'package:booking/booking.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';

part 'home_api.g.dart';

class HomeAPIEndpoints {
  static const String getHomeContent = '/api/v1/home';
  static const String getSearchContent = '/api/v1/home/search';
  static const String getCategoryServices = '/api/v1/categories/{categoryId}/services';
  static const String getOffers = '/api/v1/offers';
  static const String getSliders = '/api/v1/sliders';
}

@injectable
@RestApi()
abstract class HomeAPI {
  @factoryMethod
  factory HomeAPI(Dio dio) = _HomeAPI;

  @GET(HomeAPIEndpoints.getHomeContent)
  Future<APIResponse<HomeResponseModel>> getHomeContent();

  @GET(HomeAPIEndpoints.getSearchContent)
  Future<APIResponse<SearchResponseModel>> getSearchContent();

  @GET(HomeAPIEndpoints.getCategoryServices)
  Future<APIResponse<List<ServicePreviewResponseModel>>> getCategoryServices(
    @Path('categoryId') String categoryId,
  );

  @GET(HomeAPIEndpoints.getOffers)
  Future<APIResponse<OfferModel>> getOffers();

  @GET(HomeAPIEndpoints.getSliders)
  Future<APIResponse<OfferModel>> getSliders();
}
