// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/authentication.dart' as _i6;
import 'package:authentication/src/data/api/authentication_api.dart' as _i28;
import 'package:authentication/src/data/api/user_api.dart' as _i420;
import 'package:authentication/src/domain/repository/auth_api_repository.dart'
    as _i744;
import 'package:authentication/src/domain/repository/mock_auth_api_repository.dart'
    as _i601;
import 'package:authentication/src/domain/service/session_repository.dart'
    as _i86;
import 'package:authentication/src/navigation/app_router.dart' as _i859;
import 'package:authentication/src/presentation/bloc/auth_user_bloc.dart'
    as _i37;
import 'package:authentication/src/presentation/cubit/app_cubit.dart' as _i372;
import 'package:design_system/design_system.dart' as _i1063;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:util/util.dart' as _i609;

const String _mock = 'mock';
const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i859.AppRouter>(() => _i859.AppRouter());
    gh.singleton<_i86.SessionRepository>(
      () => _i86.SessionRepository(
        gh<_i6.TokenStorage>(),
        gh<_i609.MDStorage>(),
        gh<_i609.BiometricService>(),
      ),
    );
    gh.factory<_i6.AuthRepository>(
      () => _i601.MockAuthRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i420.UserAPI>(() => _i420.UserAPI(gh<_i361.Dio>()));
    gh.factory<_i28.AuthenticationAPI>(
      () => _i28.AuthenticationAPI(gh<_i361.Dio>(instanceName: 'authDio')),
    );
    gh.singleton<_i372.AppCubit>(
      () => _i372.AppCubit(gh<_i6.SessionRepository>()),
    );
    gh.factory<_i744.AuthRepository>(
      () => _i744.AuthRepositoryImpl(
        gh<_i6.AuthenticationAPI>(),
        gh<_i6.UserAPI>(),
      ),
      registerFor: {_prod, _dev},
    );
    gh.lazySingleton<_i37.AuthUserBloc>(
      () => _i37.AuthUserBloc(
        gh<_i6.AuthRepository>(),
        gh<_i6.SessionRepository>(),
        userRole: gh<_i1063.UserRole>(),
      ),
    );
    return this;
  }
}
