import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:user/di/di_init.config.dart';

@InjectableInit(asExtension: true, initializerName: 'init')
GetIt initMain(GetIt getIt, String environment) =>
    getIt.init(environment: environment);
