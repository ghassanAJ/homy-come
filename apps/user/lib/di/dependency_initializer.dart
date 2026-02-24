import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:user/di/di_container.dart';
import 'package:util/util.dart';

import 'di_init.dart';

void initializeDependencies(String env) {
  diContainer.registerSingleton<String>(env, instanceName: 'env');

  initBaseCubit(diContainer, env);
  initApiClient(diContainer, env);

  initAuth(diContainer, env);
  initBooking(diContainer, env);

  _configureAuthInterceptor();
  initMain(diContainer, env);
  diContainer.registerSingleton<CustomRouter>(
    CustomRouter(AppRouter.createUserRouter(diContainer.get<AppCubit>())),
  );

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
