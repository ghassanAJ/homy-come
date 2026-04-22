import 'package:api_client/api_client.dart';
import 'package:booking/booking.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';

part 'home_api.g.dart';

class HomeAPIEndpoints {
  static const String getCategories = '/api/categories';
  static const String getSearchContent = '/api/v1/home/search';
  static const String getCategoryServices = '/api/categories/{categoryId}';
  static const String getOffers = '/api/offers?populate=*';
  static const String getStories = '/api/offers?populate=*';
  static const String getSliders = '/api/sliders?populate=*';
}

@injectable
@RestApi()
abstract class HomeAPI {
  @factoryMethod
  factory HomeAPI(Dio dio) = _HomeAPI;

  @GET(HomeAPIEndpoints.getCategories)
  Future<APIResponse<List<ServiceCategoryModel>>> getCategories();

  @GET(HomeAPIEndpoints.getSearchContent)
  Future<APIResponse<SearchResponseModel>> getSearchContent();

  @GET(HomeAPIEndpoints.getCategoryServices)
  Future<APIResponse<ServiceCategoryModel>> getCategoryServices(
    @Path('categoryId') String categoryId,
  );

  @GET(HomeAPIEndpoints.getOffers)
  Future<APIResponse<List<OfferModel>>> getOffers();

  @GET(HomeAPIEndpoints.getSliders)
  Future<APIResponse<List<OfferModel>>> getSliders();

  @GET(HomeAPIEndpoints.getStories)
  Future<APIResponse<List<OfferModel>>> getStories();
}
