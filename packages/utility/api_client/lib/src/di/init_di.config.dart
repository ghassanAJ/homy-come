// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:util/util.dart' as _i609;

import '../../api_client.dart' as _i362;
import '../core/factories/dio_factory.dart' as _i751;
import '../core/interceptors/auth_interceptor.dart' as _i593;
import '../core/storage/token_storage.dart' as _i561;
import 'api_module.dart' as _i804;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.factory<_i751.DioFactory>(
      () => _i751.DioFactory(gh<String>(instanceName: 'env')),
    );
    gh.singleton<_i561.TokenStorage>(
      () => _i561.TokenStorage(gh<_i609.MDStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiModule.provideAuthDio(gh<_i751.DioFactory>()),
      instanceName: 'authDio',
    );
    gh.singleton<_i593.AuthInterceptor>(
      () => _i593.AuthInterceptor(
        gh<_i362.TokenStorage>(),
        gh<_i361.Dio>(instanceName: 'authDio'),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiModule.provideDio(
        gh<_i751.DioFactory>(),
        gh<_i593.AuthInterceptor>(),
      ),
    );
    return this;
  }
}

class _$ApiModule extends _i804.ApiModule {}
