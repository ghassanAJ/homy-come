import 'package:api_client/api_client.dart';
import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/api/home_api.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:util/util.dart';

abstract class HomeRepository {
  Future<Result<HomeResponseModel, APIException>> getHomeContent();
  Future<Result<OfferModel, APIException>> getOffers();
  Future<Result<OfferModel, APIException>> getSliders();
  Future<Result<SearchResponseModel, APIException>> getSearchContent();
  Future<Result<List<ServicePreviewResponseModel>, APIException>> getCategoryServices(
    String categoryId,
  );
}

@Injectable(as: HomeRepository, env: ['prod', 'dev'])
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeAPI);

  final HomeAPI _homeAPI;

  @override
  Future<Result<HomeResponseModel, APIException>> getHomeContent() =>
      _homeAPI.getHomeContent().toResult();

  @override
  Future<Result<SearchResponseModel, APIException>> getSearchContent() =>
      _homeAPI.getSearchContent().toResult();

  @override
  Future<Result<List<ServicePreviewResponseModel>, APIException>> getCategoryServices(
    String categoryId,
  ) => _homeAPI.getCategoryServices(categoryId).toResult();

  @override
  Future<Result<OfferModel, APIException>> getOffers() =>
      _homeAPI.getOffers().toResult();

  @override
  Future<Result<OfferModel, APIException>> getSliders() =>
      _homeAPI.getSliders().toResult();
}
