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
import 'package:orders/src/cubit/order_state.dart' as _i81;
import 'package:orders/src/domain/repository/booking_api_repository.dart'
    as _i176;
import 'package:orders/src/domain/repository/mock_booking_api_repository.dart'
    as _i218;
import 'package:orders/src/domain/useCase/cancel_order_use_case.dart' as _i1058;
import 'package:orders/src/domain/useCase/get_details_booking_use_case.dart'
    as _i616;
import 'package:orders/src/domain/useCase/get_order_details_by_Id_use_case.dart'
    as _i595;
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart'
    as _i717;
import 'package:orders/src/domain/useCase/get_today_schedule_use_case.dart'
    as _i760;
import 'package:orders/src/enum/filter_order_enum.dart' as _i260;

const String _mock = 'mock';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i8.OrderCubit>(() => _i8.OrderCubit(gh<_i81.OrderState>()));
    gh.factory<_i176.OrdersRepository>(
      () => _i218.MockBookingApiRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i760.GetTodayScheduleUseCase>(
      () => _i760.GetTodayScheduleUseCase(repo: gh<_i176.OrdersRepository>()),
    );
    gh.factoryParam<_i616.GetDetailsBookingUseCase, int, dynamic>(
      (id, _) =>
          _i616.GetDetailsBookingUseCase(gh<_i176.OrdersRepository>(), id: id),
    );
    gh.factoryParam<_i717.GetOrderDetailsUseCase, _i260.FilterOrder, dynamic>(
      (status, _) => _i717.GetOrderDetailsUseCase(
        gh<_i176.OrdersRepository>(),
        status: status,
      ),
    );
    gh.factoryParam<_i595.GetOrderDetailsByIdUseCase, int, dynamic>(
      (id, _) => _i595.GetOrderDetailsByIdUseCase(
        repo: gh<_i176.OrdersRepository>(),
        id: id,
      ),
    );
    gh.factoryParam<_i1058.CancelOrderUseCase, int, String>(
      (id, reason) => _i1058.CancelOrderUseCase(
        repo: gh<_i176.OrdersRepository>(),
        id: id,
        reason: reason,
      ),
    );
    return this;
  }
}
