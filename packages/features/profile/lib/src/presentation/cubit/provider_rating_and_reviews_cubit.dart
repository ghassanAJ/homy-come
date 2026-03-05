import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/use_cases/get_provider_rating_and_reviews_use_case.dart';
import 'package:util/util.dart';

class ProviderRatingAndReviewsCubit
    extends BaseScreenCubit<List<ReviewModel>> {
  ProviderRatingAndReviewsCubit(this._repository);

  final ProfileRepository _repository;

  Future<void> fetchProviderRatingAndReviews({bool refresh = false}) {
    return fetchData(
      useCase: GetProviderRatingAndReviewsUseCase(_repository),
      refresh: refresh,
    );
  }
}
