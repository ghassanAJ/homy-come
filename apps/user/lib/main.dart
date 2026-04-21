import 'dart:async';

import 'package:booking/booking.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:user/user_app.dart';

import 'di/dependency_initializer.dart';

void main() async {
  //982605
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load();

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black, // background color
          statusBarIconBrightness: Brightness.dark, // icons = white
          statusBarBrightness: Brightness.dark, // for iOS
        ),
      );
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
