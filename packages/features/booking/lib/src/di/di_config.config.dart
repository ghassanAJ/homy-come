// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:booking/booking.dart' as _i1027;
import 'package:booking/src/data/api/booking_api.dart' as _i782;
import 'package:booking/src/domain/repository/booking_api_repository.dart'
    as _i973;
import 'package:booking/src/domain/repository/mock_booking_api_repository.dart'
    as _i682;
import 'package:booking/src/presentation/bloc/booking_wizard_bloc.dart'
    as _i258;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.factory<_i1027.BookingRepository>(
      () => _i682.MockBookingRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i782.BookingAPI>(() => _i782.BookingAPI(gh<_i361.Dio>()));
    gh.factory<_i973.BookingRepository>(
      () => _i973.BookingRepositoryImpl(gh<_i1027.BookingAPI>()),
      registerFor: {_prod, _dev},
    );
    gh.factory<_i258.BookingWizardBloc>(
      () => _i258.BookingWizardBloc(gh<_i1027.BookingRepository>()),
    );
    return this;
  }
}
