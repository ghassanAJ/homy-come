import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:homy_provider/di/di_container.dart';
import 'package:profile/profile.dart';
import 'package:util/util.dart';

import 'di_init.dart';

void initializeDependencies(String env) {
  diContainer.registerSingleton<String>(env, instanceName: 'env');
  diContainer.registerSingleton<LocalizationCubit>(LocalizationCubit());

  initBaseCubit(diContainer, env);
  initApiClient(diContainer, env);
  initProfile(diContainer, env);

  initAuth(diContainer, env);

  _configureAuthInterceptor();
  initMain(diContainer, env);
  diContainer.registerSingleton<CustomRouter>(
    CustomRouter(AppRouter.createProviderRouter(diContainer.get<AppCubit>())),
  );
}

void _configureAuthInterceptor() {
  // authInterceptor.onSessionExpired = () { ... };
  // authInterceptor.tokenRefreshCallback = (refreshToken) async { ... };
}
