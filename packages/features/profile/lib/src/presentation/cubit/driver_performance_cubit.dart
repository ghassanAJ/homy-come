import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/use_cases/get_driver_performance_use_case.dart';
import 'package:util/util.dart';

class DriverPerformanceCubit extends BaseScreenCubit<DriverPerformanceModel> {
  DriverPerformanceCubit(this._repository);

  final ProfileRepository _repository;

  Future<void> fetchDriverPerformance({
    required String driverId,
    bool refresh = false,
  }) {
    return fetchData(
      useCase: GetDriverPerformanceUseCase(_repository, driverId),
      refresh: refresh,
    );
  }
}
