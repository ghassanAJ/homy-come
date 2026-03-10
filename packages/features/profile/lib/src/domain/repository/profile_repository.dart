import 'package:api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/api/profile_api.dart';
import 'package:profile/src/data/model/res/about_app_model.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/data/model/res/myTeam_member_model.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/data/model/res/terms_and_condition_model.dart';
import 'package:util/util.dart';

abstract class ProfileRepository {
  Future<Result<AboutAppModel, APIException>> fetchAboutApp();
  Future<Result<TermsAndConditionModel, APIException>> fetchTermsAndCondition();
  Future<Result<DriverPerformanceModel, APIException>> fetchDriverPerformance(
    String driverId,
  );
  Future<Result<List<ReviewModel>, APIException>> fetchProviderReviews(
    String providerId,
  );
  Future<Result<List<MyteamMemberModel>, APIException>> fetchMyTeam();
}

@Injectable(as: ProfileRepository, env: ['prod', 'dev'])
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._profileAPI);

  final ProfileAPI _profileAPI;

  @override
  Future<Result<AboutAppModel, APIException>> fetchAboutApp() async =>
      _profileAPI.getAboutApp().toResult();

  @override
  Future<Result<TermsAndConditionModel, APIException>>
  fetchTermsAndCondition() async =>
      _profileAPI.getTermsAndCondition().toResult();

  @override
  Future<Result<DriverPerformanceModel, APIException>> fetchDriverPerformance(
    String driverId,
  ) async => _profileAPI.getDriverPerformance().toResult();

  @override
  Future<Result<List<ReviewModel>, APIException>> fetchProviderReviews(
    String providerId,
  ) async => _profileAPI.getProviderReviews().toResult();
  
  @override
  Future<Result<List<MyteamMemberModel>, APIException>> fetchMyTeam() {
  
    throw UnimplementedError();
  }
}
