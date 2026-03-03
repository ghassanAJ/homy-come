import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/datasource/home_mock_data.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:util/util.dart';

/// Mock implementation of [HomeRepository] for testing and development.
///
/// Registered only when running with [ENV]=mock.
@Injectable(as: HomeRepository, env: ['mock'])
class MockHomeRepository implements HomeRepository {
  MockHomeRepository();

  @override
  Future<Result<HomeResponseModel, APIException>> getHomeContent() async =>
      success(mockHomeResponseModel);

  @override
  Future<Result<SearchResponseModel, APIException>> getSearchContent() async =>
      success(mockSearchResponseModel);
}
