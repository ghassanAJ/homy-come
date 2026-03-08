import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

class GetProfileUseCase extends BaseUseCase<DriverPerformanceModel> {
  GetProfileUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Result<DriverPerformanceModel, APIException>> call() {
    return _repository.fetchDriverPerformance();
  }
}
