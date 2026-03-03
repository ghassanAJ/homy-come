import 'package:api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/datasource/home_mock_data.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';

abstract class HomeAPI {
  Future<APIResponse<HomeResponseModel>> getHomeContent();
  Future<APIResponse<SearchResponseModel>> getSearchContent();
}

@Injectable(as: HomeAPI, env: ['prod', 'dev'])
class HomeAPIImpl implements HomeAPI {
  @override
  Future<APIResponse<HomeResponseModel>> getHomeContent() async =>
      Future.value(SuccessResponse(mockHomeResponseModel));

  @override
  Future<APIResponse<SearchResponseModel>> getSearchContent() async =>
      Future.value(SuccessResponse(mockSearchResponseModel));
}
