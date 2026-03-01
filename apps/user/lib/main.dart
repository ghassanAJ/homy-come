import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:user/user_app.dart';

import 'di/dependency_initializer.dart';

void main() async {
  //982605
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await UIDesignSystemInitializer.initialize();

      var env = const String.fromEnvironment('ENV', defaultValue: 'mock');
      if (env.isEmpty) env = 'mock';

      initializeDependencies(env);

      // await MDDesignSystemInitializer.initialize();

      runApp(const UserApp());
    },
    (error, stack) {
      debugPrint('Uncaught error: $error');
      debugPrint('Stack trace: $stack');
    },
  );
}
