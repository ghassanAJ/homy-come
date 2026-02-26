import 'package:get_it/get_it.dart';
import 'package:user/features/home/data/repository/home_repository_impl.dart';
import 'package:user/features/home/data/repository/mock_home_repository.dart';
import 'package:user/features/home/domain/repository/home_repository.dart';

void initHome(GetIt getIt, String env) {
  if (getIt.isRegistered<HomeRepository>()) return;

  if (env == 'mock') {
    getIt.registerLazySingleton<HomeRepository>(() => MockHomeRepository());
    return;
  }

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
}
