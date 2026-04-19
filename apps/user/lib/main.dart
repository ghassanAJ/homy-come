import 'dart:async';

import 'package:booking/booking.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:user/user_app.dart';

import 'di/dependency_initializer.dart';

void main() async {
  //982605
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Stripe.publishableKey = String.fromEnvironment(
      //   'API_KEY',
      //   defaultValue: 'mock',
      // );
      // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
      // Stripe.urlScheme = 'flutterstripe';
      // await Stripe.instance.applySettings();

      await UIDesignSystemInitializer.initialize();
      var env = const String.fromEnvironment('ENV', defaultValue: 'mock');

      if (env.isEmpty) env = 'dev';

      initializeDependencies(env);
      // await MDDesignSystemInitializer.initialize();

      runApp(UserApp());
    },
    (error, stack) {
      debugPrint('Uncaught error: $error');
      debugPrint('Stack trace: $stack');
    },
  );
}
