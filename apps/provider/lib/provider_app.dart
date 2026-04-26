import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:homy_provider/di/di_container.dart';
import 'package:homy_provider/localization/provider_localization_delegate.dart';
import 'package:homy_provider/navigation/route.dart';
import 'package:util/util.dart';

const userRole = UserRole.provider;

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

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
                        dashboardPath: ProviderPaths.homeProvider,
                        router: router,
                        child: MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          title: 'YC- Provider',
                          localizationsDelegates: [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            ProviderLocalizationDelegate(),
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
          value: diContainer.get<AppCubit>()..init(UserRole.provider),
        ),
        BlocProvider.value(
          value: AuthUserBloc(
            diContainer.get<AuthRepository>(),
            diContainer.get<SessionRepository>(),
            userRole: UserRole.provider,
          ),
        ),
      ],
      child: child,
    );
  }
}
