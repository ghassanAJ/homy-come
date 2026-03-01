import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:notifications/notifications.dart';
import 'package:user/di/di_container.dart';
import 'package:util/util.dart';

import 'di_init.dart';

bool _dependenciesInitialized = false;

void initializeDependencies(String env) {
  if (_dependenciesInitialized) {
    return;
  }

  diContainer.registerSingleton<String>(env, instanceName: 'env');

  initBaseCubit(diContainer, env);
  initApiClient(diContainer, env);
  initNotifications(diContainer, env);

  initAuth(diContainer, env);

  _configureAuthInterceptor();
  initMain(diContainer, env);
  diContainer.registerSingleton<CustomRouter>(
    CustomRouter(AppRouter.createUserRouter(diContainer.get<AppCubit>())),
  );

  _dependenciesInitialized = true;

  // initAuthentication(diContainer, env);
}

void _configureAuthInterceptor() {
  final authInterceptor = diContainer.get<AuthInterceptor>();
  final authUserBloc = diContainer.get<AuthUserBloc>();
  final authRepository = diContainer.get<AuthRepository>();

  authInterceptor.onSessionExpired = () {
    authUserBloc.add(SessionExpired());
  };

  authInterceptor.tokenRefreshCallback = (refreshToken) async {
    final result = await authRepository.refreshToken(refreshToken);
    return result.fold(
      (tokenModel) => (
        accessToken: tokenModel.accessToken,
        refreshToken: tokenModel.refreshToken,
      ),
      (_) => null,
    );
  };
}
