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
import 'package:profile/src/data/api/profile_api.dart' as _i468;
import 'package:profile/src/domain/repository/mock_profile_repository.dart'
    as _i758;
import 'package:profile/src/domain/repository/profile_repository.dart' as _i50;
import 'package:profile/src/domain/use_cases/get_my_team_use_case.dart'
    as _i278;
import 'package:profile/src/presentation/cubit/about_app_cubit.dart' as _i786;
import 'package:profile/src/presentation/cubit/driver_performance_cubit.dart'
    as _i233;
import 'package:profile/src/presentation/cubit/myTeam_cubit.dart' as _i821;
import 'package:profile/src/presentation/cubit/provider_rating_and_reviews_cubit.dart'
    as _i544;
import 'package:profile/src/presentation/cubit/terms_and_condition_cubit.dart'
    as _i1002;

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
    gh.factory<_i468.ProfileAPI>(() => _i468.ProfileAPI(gh<_i361.Dio>()));
    gh.factory<_i50.ProfileRepository>(
      () => _i758.MockProfileRepository(),
      registerFor: {_mock},
    );
    gh.factory<_i50.ProfileRepository>(
      () => _i50.ProfileRepositoryImpl(gh<_i468.ProfileAPI>()),
      registerFor: {_prod, _dev},
    );
    gh.factory<_i278.GetMyTeamUseCase>(
      () => _i278.GetMyTeamUseCase(gh<_i50.ProfileRepository>()),
    );
    gh.factory<_i786.AboutAppCubit>(
      () => _i786.AboutAppCubit(gh<_i50.ProfileRepository>()),
    );
    gh.factory<_i233.DriverPerformanceCubit>(
      () => _i233.DriverPerformanceCubit(gh<_i50.ProfileRepository>()),
    );
    gh.factory<_i544.ProviderRatingAndReviewsCubit>(
      () => _i544.ProviderRatingAndReviewsCubit(gh<_i50.ProfileRepository>()),
    );
    gh.factory<_i1002.TermsAndConditionCubit>(
      () => _i1002.TermsAndConditionCubit(gh<_i50.ProfileRepository>()),
    );
    gh.factory<_i821.MyteamCubit>(
      () => _i821.MyteamCubit(gh<_i278.GetMyTeamUseCase>()),
    );
    return this;
  }
}
