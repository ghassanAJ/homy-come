import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_config.config.dart';

@InjectableInit(asExtension: true)
void initHome(GetIt getIt, String env) => getIt.init(environment: env);
