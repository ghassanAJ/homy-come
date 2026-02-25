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
import 'package:util/src/base_cubit/base_cubit.dart' as _i978;
import 'package:util/src/base_cubit/base_list_cubit.dart' as _i848;
import 'package:util/src/biometric/biometric_service.dart' as _i272;
import 'package:util/src/image_picker/image_picker_service.dart' as _i729;
import 'package:util/src/interface/storage.dart' as _i1005;
import 'package:util/src/share/share_helper.dart' as _i653;
import 'package:util/src/third_party/flutter_secure_storage.dart' as _i1045;
import 'package:util/util.dart' as _i609;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i978.BaseCubit<dynamic>>(() => _i978.BaseCubit<dynamic>());
    gh.factory<_i978.BaseScreenCubit<dynamic>>(
      () => _i978.BaseScreenCubit<dynamic>(),
    );
    gh.factory<_i729.ImagePickerService>(() => _i729.ImagePickerService());
    gh.lazySingleton<_i272.BiometricService>(() => _i272.BiometricService());
    gh.factory<_i653.ShareHelper>(() => _i653.ShareHelperImpl());
    gh.lazySingleton<_i1005.MDStorage>(() => _i1045.MDSecureStorage());
    gh.factory<_i848.BaseListCubit<dynamic>>(
      () => _i848.BaseListCubit<dynamic>(
        loader: gh<_i609.BaseUseCase<List<dynamic>>>(),
      ),
    );
    return this;
  }
}
