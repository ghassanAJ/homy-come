import 'package:profile/src/data/model/res/terms_and_condition_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

class GetTermsAndConditionUseCase
    extends BaseUseCase<TermsAndConditionModel> {
  GetTermsAndConditionUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Result<TermsAndConditionModel, APIException>> call() {
    return _repository.fetchTermsAndCondition();
  }
}
