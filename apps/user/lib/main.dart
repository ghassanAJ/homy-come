import 'dart:async';

import 'package:booking/booking.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/user_app.dart';

import 'di/dependency_initializer.dart';

void main() async {
  //982605
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await UIDesignSystemInitializer.initialize();

      var env = const String.fromEnvironment('ENV', defaultValue: 'mock');
      if (env.isEmpty) env = 'dev';

      initializeDependencies(env);
      // await MDDesignSystemInitializer.initialize();

      runApp(
        BlocProvider(
          create:
              (context) =>
                  diContainer.get<HomeBloc>()
                    ..add(LoadHomeContentEvent())
                    ..add(LoadOffersEvent())
                    ..add(LoadSlidersEvent()),
          child: const UserApp(),
        ),
      );
    },
    (error, stack) {
      debugPrint('Uncaught error: $error');
      debugPrint('Stack trace: $stack');
    },
  );
}
