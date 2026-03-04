import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/use_cases/get_profile_use_case.dart';
import 'package:util/util.dart';

class ProfileCubit extends BaseScreenCubit<DriverPerformanceModel> {
  ProfileCubit(this._repository);

  final ProfileRepository _repository;

  Future<void> fetchDriverPerformance({bool refresh = false}) {
    return fetchData(
      useCase: GetProfileUseCase(_repository),
      refresh: refresh,
    );
  }
}
