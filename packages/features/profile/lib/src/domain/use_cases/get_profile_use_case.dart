import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

enum ProfileFetchType { driverProfile, providerProfile }

class GetProfileUseCase extends BaseUseCase<dynamic> {
  GetProfileUseCase.driverPerformance(this._repository)
    : _fetchType = ProfileFetchType.driverProfile;

  GetProfileUseCase.providerRatingAndReviews(this._repository)
    : _fetchType = ProfileFetchType.providerProfile;

  final ProfileRepository _repository;
  final ProfileFetchType _fetchType;

  @override
  Future<Result<dynamic, APIException>> call() {
    return switch (_fetchType) {
      ProfileFetchType.driverProfile =>
        _repository.fetchDriverPerformance(),
      ProfileFetchType.providerProfile =>
        _repository.fetchProviderReviews(),
    };
  }
}
