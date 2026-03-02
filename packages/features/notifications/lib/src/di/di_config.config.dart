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
import 'package:notifications/src/data/api/notifications_api.dart' as _i288;
import 'package:notifications/src/domain/repository/mock_notifications_repository.dart'
    as _i520;
import 'package:notifications/src/domain/repository/notifications_repository.dart'
    as _i91;

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
    gh.factory<_i91.NotificationsRepository>(
      () => _i520.MockNotificationsRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i288.NotificationsAPI>(
      () => _i288.NotificationsAPI(gh<_i361.Dio>()),
    );
    gh.factory<_i91.NotificationsRepository>(
      () => _i91.NotificationsRepositoryImpl(gh<_i288.NotificationsAPI>()),
      registerFor: {_prod, _dev},
    );
    return this;
  }
}
