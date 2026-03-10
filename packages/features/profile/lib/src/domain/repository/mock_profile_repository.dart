import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/about_app_model.dart';
import 'package:profile/src/data/model/res/driver_performance_metric_model.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/data/model/res/myTeam_member_model.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/data/model/res/terms_and_condition_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

@Injectable(as: ProfileRepository, env: ['mock'])
class MockProfileRepository implements ProfileRepository {
  static const String _aboutAppDescription =
      'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do '
      'Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim '
      'Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut '
      'Aliquip Ex Ea Commodo Consequat.';
  static const String _termsAndConditionDescription =
      'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do '
      'Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim '
      'Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut '
      'Aliquip Ex Ea Commodo Consequat.';

  bool failFetchMyteamData = false;
  @override
  Future<Result<AboutAppModel, APIException>> fetchAboutApp() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return success(const AboutAppModel(description: _aboutAppDescription));
  }

  @override
  Future<Result<TermsAndConditionModel, APIException>>
  fetchTermsAndCondition() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return success(
      const TermsAndConditionModel(description: _termsAndConditionDescription),
    );
  }

  @override
  Future<Result<DriverPerformanceModel, APIException>> fetchDriverPerformance(
    String driverId,
  ) async {
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
  Future<Result<List<ReviewModel>, APIException>> fetchProviderReviews(
    String providerId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 400));

    return success(const [
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
    ]);
  }

  @override
  Future<Result<List<MyteamMemberModel>, APIException>> fetchMyTeam() async {
    if (failFetchMyteamData) {
      failFetchMyteamData = false;
      return Future.error(APIException.error('error mock data'));
    }
    await Future.delayed(const Duration(milliseconds: 500));
    return success([
      MyteamMemberModel(
        id: 1,
        nameMember: 'ghassan',
        phone: '963123456789',
        status: 'working',
      ),
      MyteamMemberModel(
        id: 2,
        nameMember: 'hala gh',
        phone: '963123456789',
        status: 'working',
      ),
      MyteamMemberModel(
        id: 3,
        nameMember: 'bushra',
        phone: '963123456789',
        status: 'working',
      ),
      MyteamMemberModel(
        id: 4,
        nameMember: 'meya  ali',
        phone: '963123456789',
        status: 'working',
      ),
      MyteamMemberModel(
        id: 1,
        nameMember: 'Samia mohammad ghhhghghghghghg',
        phone: '963123456789',
        status: 'working',
      ),
    ]);
  }
}
