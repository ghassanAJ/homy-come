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
import 'package:profile/src/data/api/driver_performance_api.dart' as _i1023;
import 'package:profile/src/domain/repository/driver_performance_repository.dart'
    as _i152;
import 'package:profile/src/domain/repository/mock_driver_performance_repository.dart'
    as _i109;

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
    gh.factory<_i1023.DriverPerformanceAPI>(
      () => _i1023.DriverPerformanceAPI(gh<_i361.Dio>()),
    );
    gh.factory<_i152.DriverPerformanceRepository>(
      () => _i109.MockDriverPerformanceRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i152.DriverPerformanceRepository>(
      () => _i152.DriverPerformanceRepositoryImpl(
        gh<_i1023.DriverPerformanceAPI>(),
      ),
      registerFor: {_prod, _dev},
    );
    return this;
  }
}
