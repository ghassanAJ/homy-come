import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:driver/di/di_container.dart';
import 'package:driver/navigation/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:util/util.dart';

const UserRole userRole = UserRole.driver;

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = diContainer.get<CustomRouter>().router;
    final localeCubit = diContainer.get<LocalizationCubit>();

    return MDToastificationWrapper(
      child: AppProviders(
        child: BlocProvider.value(
          value: localeCubit,
          child: BlocBuilder<LocalizationCubit, Locale>(
            builder:
                (context, locale) =>
                    LocalizationProvider<AuthenticationTranslation>(
                      delegate: AuthLocalizationDelegate(),
                      locale: locale,
                      child: AuthNavigationListener(
                        dashboardPath: DriverPaths.home,

                        router: router,
                        child: MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          title: 'Homy Driver',
                          localizationsDelegates: [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                          supportedLocales: Config.supportedLocales,
                          locale: locale,
                          routerConfig: router,
                        ),
                      ),
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
        BlocProvider.value(
          value: diContainer.get<AppCubit>()..init(UserRole.driver),
        ),
        BlocProvider.value(
          value: AuthUserBloc(
            diContainer.get<AuthRepository>(),
            diContainer.get<SessionRepository>(),
            userRole: userRole,
          ),
        ),
      ],
      child: child,
    );
  }
}
