import 'package:api_client/api_client.dart';
import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/api/home_api.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:util/util.dart';

abstract class HomeRepository {
  Future<Result<List<ServiceCategoryModel>, APIException>> getCategories();
  Future<Result<List<OfferModel>, APIException>> getOffers();
  Future<Result<List<OfferModel>, APIException>> getSliders();
  Future<Result<List<OfferModel>, APIException>> getStories();
  Future<Result<SearchResponseModel, APIException>> getSearchContent(
    String qwery,
  );
  Future<Result<ServiceCategoryModel, APIException>> getCategoryServices(
    String categoryId,
  );
}

@Injectable(as: HomeRepository, env: ['prod', 'dev'])
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeAPI);

  final HomeAPI _homeAPI;

  @override
  Future<Result<List<ServiceCategoryModel>, APIException>> getCategories() =>
      _homeAPI.getCategories().toResult();

  @override
  Future<Result<SearchResponseModel, APIException>> getSearchContent(
    String qwery,
  ) => _homeAPI.getSearchContent(qwery).toResult();

  @override
  Future<Result<ServiceCategoryModel, APIException>> getCategoryServices(
    String categoryId,
  ) => _homeAPI.getCategoryServices(categoryId).toResult();

  @override
  Future<Result<List<OfferModel>, APIException>> getOffers() =>
      _homeAPI.getOffers().toResult();

  @override
  Future<Result<List<OfferModel>, APIException>> getSliders() =>
      _homeAPI.getSliders().toResult();

  @override
  Future<Result<List<OfferModel>, APIException>> getStories() =>
      _homeAPI.getStories().toResult();
}
