import 'package:get_it/get_it.dart';
import 'package:homy_provider/di/di_init.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(asExtension: true, initializerName: 'init')
GetIt initMain(GetIt getIt, String environment) => getIt.init();
