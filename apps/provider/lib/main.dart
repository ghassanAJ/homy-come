import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:homy_provider/provider_app.dart';

import 'di/dependency_initializer.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final env = const String.fromEnvironment('ENV', defaultValue: 'dev');

      initializeDependencies(env);

      runApp(const ProviderApp());
    },
    (error, stack) {
      debugPrint('Uncaught error: $error');
      debugPrint('Stack trace: $stack');
    },
  );
}
