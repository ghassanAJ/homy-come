// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/authentication.dart' as _i6;
import 'package:authentication/src/di/auth_module.dart' as _i850;
import 'package:authentication/src/domain/api/authentication_api.dart' as _i905;
import 'package:authentication/src/domain/bloc/auth_user_bloc.dart' as _i295;
import 'package:authentication/src/domain/service/session_repository.dart'
    as _i86;
import 'package:authentication/src/navigation/app_router.dart' as _i859;
import 'package:authentication/src/presentation/cubit/app_cubit.dart' as _i372;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:util/util.dart' as _i609;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final authModule = _$AuthModule();
    gh.lazySingleton<_i859.AppRouter>(() => _i859.AppRouter());
    gh.singleton<_i86.SessionRepository>(
      () => _i86.SessionRepository(
        gh<_i6.TokenStorage>(),
        gh<_i609.MDStorage>(),
        gh<_i609.BiometricService>(),
      ),
    );
    gh.factory<_i6.UserAPI>(() => authModule.provideUserAPI(gh<_i361.Dio>()));
    gh.factory<_i905.AuthenticationAPI>(
      () => _i905.AuthenticationAPI(gh<_i361.Dio>(instanceName: 'authDio')),
    );
    gh.factory<_i6.AuthRepository>(
      () => authModule.provideAuthRepository(
        gh<_i6.AuthenticationAPI>(),
        gh<_i6.UserAPI>(),
      ),
    );
    gh.lazySingleton<_i295.AuthUserBloc>(
      () => _i295.AuthUserBloc(
        gh<_i6.AuthRepository>(),
        gh<_i6.SessionRepository>(),
      ),
    );
    gh.singleton<_i372.AppCubit>(
      () => _i372.AppCubit(gh<_i6.SessionRepository>()),
    );
    return this;
  }
}

class _$AuthModule extends _i850.AuthModule {}
