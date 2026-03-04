import 'package:api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/api/profile_api.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:util/util.dart';

abstract class ProfileRepository {
  Future<Result<DriverPerformanceModel, APIException>> fetchDriverPerformance();
}

@Injectable(as: ProfileRepository, env: ['prod', 'dev'])
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._driverPerformanceAPI);

  final ProfileAPI _driverPerformanceAPI;

  @override
  Future<Result<DriverPerformanceModel, APIException>>
  fetchDriverPerformance() async => _driverPerformanceAPI
      .getDriverPerformance()
      .toResult();
}
