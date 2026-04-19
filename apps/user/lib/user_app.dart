import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:orders/orders.dart';
import 'package:profile/profile.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:util/util.dart';

const UserRole userRole = UserRole.user;

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
                (context, locale) =>
                    LocalizationProvider<AuthenticationTranslation>(
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
        BlocProvider(create: (context) => diContainer.get<BookingWizardBloc>()),
        BlocProvider(
          create:
              (context) =>
                  diContainer.get<HomeBloc>()
                    ..add(LoadHomeContentEvent())
                    ..add(LoadOffersEvent())
                    ..add(LoadSlidersEvent()),
        ),
        BlocProvider.value(value: diContainer.get<AppCubit>()),
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
