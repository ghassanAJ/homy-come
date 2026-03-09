import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:user/di/di_container.dart';
import 'package:util/util.dart';
import 'package:profile/profile.dart';
import 'package:orders/orders.dart';
class UserApp extends StatelessWidget {
  const UserApp({super.key});

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
                (context, locale) => LocalizationProvider<AuthenticationTranslation>(
                  delegate: AuthLocalizationDelegate(),
                  locale: locale,
                  child: AuthNavigationListener(
                    router: router,
                    child: MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      title: 'Homy',
                      // theme: MDTheme.styles.createThemeData(),
                      localizationsDelegates: [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        ProfileLocalizationDelegate(),
                        OrdersLocalizationDelegate(),

                        // BaseLocalization<ChildTranslation>().delegate(
                        //   ChildTranslationMap.translation,
                        // ),
                        // BaseLocalization<TaskTranslation>().delegate(
                        //   TaskTranslationMap.translation,
                        // ),
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
        // BlocProvider(create: (context) => MDThemeCubit(MDThemeState(0))),
        BlocProvider.value(value: diContainer.get<AppCubit>()),
        BlocProvider.value(value: diContainer.get<AuthUserBloc>()),
      ],
      child: child,
    );
  }
}
