import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/use_cases/get_profile_use_case.dart';
import 'package:util/util.dart';

class ProfileCubit extends BaseScreenCubit<dynamic> {
  ProfileCubit(this._repository);

  final ProfileRepository _repository;

  Future<void> fetchDriverPerformance({bool refresh = false}) {
    return fetchData(
      useCase: GetProfileUseCase.driverPerformance(_repository),
      refresh: refresh,
    );
  }

  Future<void> fetchProviderRatingAndReviews({bool refresh = false}) {
    return fetchData(
      useCase: GetProfileUseCase.providerRatingAndReviews(_repository),
      refresh: refresh,
    );
  }
}
