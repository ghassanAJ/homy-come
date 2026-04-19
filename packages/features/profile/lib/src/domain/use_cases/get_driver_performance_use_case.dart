import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

class GetDriverPerformanceUseCase extends BaseUseCase<DriverPerformanceModel> {
  GetDriverPerformanceUseCase(this._repository, this._driverId);

  final ProfileRepository _repository;
  final String _driverId;

  @override
  Future<Result<DriverPerformanceModel, APIException>> call() {
    return _repository.fetchDriverPerformance(_driverId);
  }
}
