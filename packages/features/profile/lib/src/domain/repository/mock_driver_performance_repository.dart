import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/driver_performance_metric_model.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/driver_performance_repository.dart';
import 'package:util/util.dart';

@Injectable(as: DriverPerformanceRepository, env: ['mock'])
class MockDriverPerformanceRepository implements DriverPerformanceRepository {
  @override
  Future<Result<DriverPerformanceModel, APIException>>
  fetchDriverPerformance() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return success(
      const DriverPerformanceModel(
        ordersCount: 64,
        metrics: [
          DriverPerformanceMetricModel(
            type: DriverPerformanceMetricType.completed,
            percentage: 60,
            donutRatio: 0.22,
          ),
          DriverPerformanceMetricModel(
            type: DriverPerformanceMetricType.canceledOrder,
            percentage: 10,
            donutRatio: 0.28,
          ),
          DriverPerformanceMetricModel(
            type: DriverPerformanceMetricType.punctuality,
            percentage: 80,
            donutRatio: 0.25,
          ),
          DriverPerformanceMetricModel(
            type: DriverPerformanceMetricType.customerSatisfaction,
            percentage: 60,
            donutRatio: 0.25,
          ),
        ],
      ),
    );
  }
}
