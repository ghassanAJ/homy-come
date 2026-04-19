import 'package:profile/src/data/model/res/about_app_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

class GetAboutAppUseCase extends BaseUseCase<AboutAppModel> {
  GetAboutAppUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Result<AboutAppModel, APIException>> call() {
    return _repository.fetchAboutApp();
  }
}
