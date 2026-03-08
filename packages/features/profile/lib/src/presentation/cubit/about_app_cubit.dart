import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/about_app_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/use_cases/get_about_app_use_case.dart';
import 'package:util/util.dart';

@injectable
class AboutAppCubit extends BaseScreenCubit<AboutAppModel> {
  AboutAppCubit(this._repository);

  final ProfileRepository _repository;

  Future<void> fetchAboutApp({bool refresh = false}) {
    return fetchData(
      useCase: GetAboutAppUseCase(_repository),
      refresh: refresh,
    );
  }
}
