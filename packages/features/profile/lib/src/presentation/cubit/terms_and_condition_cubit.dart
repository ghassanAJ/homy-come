import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/terms_and_condition_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/use_cases/get_terms_and_condition_use_case.dart';
import 'package:util/util.dart';

@injectable
class TermsAndConditionCubit
    extends BaseScreenCubit<TermsAndConditionModel> {
  TermsAndConditionCubit(this._repository);

  final ProfileRepository _repository;

  Future<void> fetchTermsAndCondition({bool refresh = false}) {
    return fetchData(
      useCase: GetTermsAndConditionUseCase(_repository),
      refresh: refresh,
    );
  }
}
