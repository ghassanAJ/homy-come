import 'dart:async';
import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:driver/driver_app.dart';

import 'di/dependency_initializer.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      var env = const String.fromEnvironment('ENV', defaultValue: 'dev');
      if (env.isEmpty) env = 'dev';
      log('Environment: $env');

      initializeDependencies(env);

      runApp(const DriverApp());
    },
    (error, stack) {
      debugPrint('Uncaught error: $error');
      debugPrint('Stack trace: $stack');
    },
  );
}
