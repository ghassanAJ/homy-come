import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/driver_performance_repository.dart';
import 'package:profile/src/domain/use_cases/get_driver_performance_use_case.dart';
import 'package:util/util.dart';

class DriverPerformanceCubit extends BaseScreenCubit<DriverPerformanceModel> {
  DriverPerformanceCubit(this._repository);

  final DriverPerformanceRepository _repository;

  Future<void> fetchDriverPerformance({bool refresh = false}) {
    return fetchData(
      useCase: GetDriverPerformanceUseCase(_repository),
      refresh: refresh,
    );
  }
}
