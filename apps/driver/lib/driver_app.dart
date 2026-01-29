import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:driver/di/di_container.dart';
import 'package:driver/localization/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:util/util.dart';

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = diContainer.get<CustomRouter>().router;

    return MDToastificationWrapper(
      child: AppProviders(
        child: AuthNavigationListener(
          router: router,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Homy Driver',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: Config.supportedLocales,
            locale: Config.getDeviceLocale(),
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: diContainer.get<AppCubit>()),
        BlocProvider.value(value: diContainer.get<AuthUserBloc>()),
      ],
      child: child,
    );
  }
}
