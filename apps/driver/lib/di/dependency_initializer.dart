import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:driver/di/di_container.dart';
import 'package:util/util.dart';

import 'di_init.dart';

void initializeDependencies(String env) {
  diContainer.registerSingleton<String>(env, instanceName: 'env');

  initBaseCubit(diContainer, env);
  initApiClient(diContainer, env);

  initAuth(diContainer, env);

  _configureAuthInterceptor();
  initMain(diContainer, env);
  diContainer.registerSingleton<LocalizationCubit>(LocalizationCubit());
  diContainer.registerSingleton<CustomRouter>(
    CustomRouter(AppRouter.creaetDriverRouter(diContainer.get<AppCubit>())),
  );
}

void _configureAuthInterceptor() {
  // authInterceptor.onSessionExpired = () { ... };
  // authInterceptor.tokenRefreshCallback = (refreshToken) async { ... };
}
