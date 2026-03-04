import 'package:api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/api/profile_api.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:util/util.dart';

abstract class ProfileRepository {
  Future<Result<DriverPerformanceModel, APIException>> fetchDriverPerformance();
  Future<Result<List<ReviewModel>, APIException>> fetchProviderReviews();
}

@Injectable(as: ProfileRepository, env: ['prod', 'dev'])
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._profileAPI);

  final ProfileAPI _profileAPI;

  @override
  Future<Result<DriverPerformanceModel, APIException>>
  fetchDriverPerformance() async =>
      _profileAPI.getDriverPerformance().toResult();

  @override
  Future<Result<List<ReviewModel>, APIException>> fetchProviderReviews() async =>
      _profileAPI.getProviderReviews().toResult();
}
