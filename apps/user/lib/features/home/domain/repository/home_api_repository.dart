import 'package:api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/api/home_api.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:util/util.dart';

abstract class HomeRepository {
  Future<Result<HomeResponseModel, APIException>> getHomeContent();
  Future<Result<SearchResponseModel, APIException>> getSearchContent();
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
}
