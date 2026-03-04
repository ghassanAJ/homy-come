import 'package:api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/api/driver_performance_api.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:util/util.dart';

abstract class DriverPerformanceRepository {
  Future<Result<DriverPerformanceModel, APIException>> fetchDriverPerformance();
}

@Injectable(as: DriverPerformanceRepository, env: ['prod', 'dev'])
class DriverPerformanceRepositoryImpl implements DriverPerformanceRepository {
  DriverPerformanceRepositoryImpl(this._driverPerformanceAPI);

  final DriverPerformanceAPI _driverPerformanceAPI;

  @override
  Future<Result<DriverPerformanceModel, APIException>>
  fetchDriverPerformance() async => _driverPerformanceAPI
      .getDriverPerformance()
      .toResult();
}
