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

      // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
      // Stripe.urlScheme = 'flutterstripe';
      // Stripe.publishableKey =
      //     'pk_test_51TNwR7LRLlVtHJNJvS0nZFRZu0NApBkxgBXBtosWomxpnNtPtouxZw1SWrwwV0QtpgsNNz1W60cOA5I2iYwVFrf800WNWF079O';
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
