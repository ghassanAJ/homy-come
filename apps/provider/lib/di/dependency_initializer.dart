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
  // final authInterceptor = diContainer.get<AuthInterceptor>();
  // final authUserBloc = diContainer.get<AuthUserBloc>();
  // final authRepository = diContainer.get<AuthRepository>();

  // authInterceptor.onSessionExpired = () {
  //   authUserBloc.add(SessionExpired());
  // };

  // authInterceptor.tokenRefreshCallback = (refreshToken) async {
  //   final result = await authRepository.refreshToken(refreshToken);
  //   return result.fold(
  //     (tokenModel) => (
  //       accessToken: tokenModel.accessToken,
  //       refreshToken: tokenModel.refreshToken,
  //     ),
  //     (_) => null,
  //   );
  // };
}
