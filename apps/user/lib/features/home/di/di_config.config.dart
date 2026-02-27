// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:user/features/home/data/api/home_api.dart' as _i17;
import 'package:user/features/home/domain/repository/home_api_repository.dart'
    as _i66;
import 'package:user/features/home/domain/repository/mock_home_api_repository.dart'
    as _i268;

const String _mock = 'mock';
const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i66.HomeRepository>(
      () => _i268.MockHomeRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i17.HomeAPI>(() => _i17.HomeAPI());
    gh.factory<_i66.HomeRepository>(
      () => _i66.HomeRepositoryImpl(gh<_i17.HomeAPI>()),
      registerFor: {_prod, _dev},
    );
    return this;
  }
}
