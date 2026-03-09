import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

class GetProviderRatingAndReviewsUseCase extends BaseUseCase<List<ReviewModel>> {
  GetProviderRatingAndReviewsUseCase(this._repository, this._providerId);

  final ProfileRepository _repository;
  final String _providerId;

  @override
  Future<Result<List<ReviewModel>, APIException>> call() {
    return _repository.fetchProviderReviews(_providerId);
  }
}
