import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/driver_performance_repository.dart';
import 'package:util/util.dart';

class GetDriverPerformanceUseCase extends BaseUseCase<DriverPerformanceModel> {
  GetDriverPerformanceUseCase(this._repository);

  final DriverPerformanceRepository _repository;

  @override
  Future<Result<DriverPerformanceModel, APIException>> call() {
    return _repository.fetchDriverPerformance();
  }
}
