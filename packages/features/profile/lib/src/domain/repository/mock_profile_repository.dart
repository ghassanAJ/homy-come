import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/driver_performance_metric_model.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

@Injectable(as: ProfileRepository, env: ['mock'])
class MockProfileRepository implements ProfileRepository {
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

  @override
  Future<Result<List<ReviewModel>, APIException>> fetchProviderReviews() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return success(
      const [
        ReviewModel(
          name: 'Joan Perkins',
          timeAgo: '1 days ago',
          comment:
              'I love the work. She works in a calm and gentle manner, with a perfect result. I am excited to work again!',
          rating: 5.0,
        ),
        ReviewModel(
          name: 'Joan Perkins',
          timeAgo: '4 days ago',
          comment:
              'I love the work. She works in a calm and gentle manner, with a perfect result. I am excited to work again!',
          rating: 3.0,
        ),
        ReviewModel(
          name: 'Joan Perkins',
          timeAgo: '1 month',
          comment: 'OMG!! that\'s so amazing',
          rating: 4.0,
        ),
      ],
    );
  }
}
