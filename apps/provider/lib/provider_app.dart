import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:homy_provider/di/di_container.dart';
import 'package:util/util.dart';

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = diContainer.get<CustomRouter>().router;

    return LocalizationProvider<AuthenticationTranslation>(
      delegate: AuthLocalizationDelegate(),
      locale: Config.getDeviceLocale(),
      child: MDToastificationWrapper(
        child: AppProviders(
          child: AuthNavigationListener(
            router: router,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Homy Provider',
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
