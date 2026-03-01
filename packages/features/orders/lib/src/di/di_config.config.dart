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
import 'package:orders/src/cubit/order_cubit.dart' as _i8;
import 'package:orders/src/domain/repository/booking_api_repository.dart'
    as _i176;
import 'package:orders/src/domain/repository/mock_booking_api_repository.dart'
    as _i218;

const String _mock = 'mock';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i176.OrdersRepository>(
      () => _i218.MockBookingApiRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i8.OrderCubit>(
      () => _i8.OrderCubit(gh<_i176.OrdersRepository>()),
    );
    return this;
  }
}
