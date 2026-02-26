import 'package:get_it/get_it.dart';
import 'package:user/domain/repository/home_repository.dart';
import 'package:user/domain/repository/mock_home_repository.dart';

void initHome(GetIt getIt, String env) {
  if (getIt.isRegistered<HomeRepository>()) return;

  if (env == 'mock') {
    getIt.registerLazySingleton<HomeRepository>(() => MockHomeRepository());
    return;
  }

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
}
