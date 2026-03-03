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
import 'package:user/features/home/data/api/home_api.dart' as _i931;
import 'package:user/features/home/domain/repository/home_api_repository.dart'
    as _i345;
import 'package:user/features/home/domain/repository/mock_home_api_repository.dart'
    as _i1042;

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
    gh.factory<_i931.HomeAPI>(() => _i931.HomeAPI());
    gh.factory<_i345.HomeRepository>(
      () => _i1042.MockHomeRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i345.HomeRepository>(
      () => _i345.HomeRepositoryImpl(gh<_i931.HomeAPI>()),
      registerFor: {_prod, _dev},
    );
    return this;
  }
}
