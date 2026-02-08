import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:util/src/di/di_config.config.dart';

@InjectableInit(asExtension: true)
void initUtil(GetIt diContainer, String environment) {
  diContainer.init(environment: environment);
}

@InjectableInit(asExtension: true)
GetIt initBaseCubit(GetIt getIt, String env) => getIt.init(environment: env);
