// import 'package:authentication/src/presentation/screens/onboarding/splash_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/screens/about_app_screen.dart';
import 'package:profile/src/presentation/screens/driver_language_settings_screen.dart';
import 'package:profile/src/presentation/screens/profile_settings_screen.dart';
import 'package:profile/src/presentation/screens/terms_and_condition.dart';

/// Profile route paths
class ProfilePaths {
  static const String profile = '/profile_page';
  static const String myOrder = '/my_order_screen';
  static const String termsAndCondition = '/term_and_condition_screen';
  static const String aboutApp = '/about_app_screen';
  static const String driverProfileSettings = '/driver-profile-settings';
  static const String driverLanguageSettings = '/driver-language-settings';
}

class ProfileRoute {
  static List<RouteBase> get routes => [
    GoRoute(
      path: ProfilePaths.profile,
      builder:
          (context, state) =>
              const ProfileLocalizationScope(child: ProfileScreen()),
    ),
    // GoRoute(
    //   path: ProfilePaths.myOrder,
    //   builder: (context, state) => MyOrderScreen(),
    // ),

    GoRoute(
      path: ProfilePaths.termsAndCondition,
      builder: (context, state) => TermsAndCondition(),
    ),
    GoRoute(
      path: ProfilePaths.aboutApp,
      builder: (context, state) => AboutUsScreen(),
    ),
    GoRoute(
      path: ProfilePaths.driverProfileSettings,
      builder:
          (context, state) => const ProfileLocalizationScope(
            child: ProfileSettingsScreen(),
          ),
    ),
    GoRoute(
      path: ProfilePaths.driverLanguageSettings,
      builder:
          (context, state) => const ProfileLocalizationScope(
            child: DriverLanguageSettingsScreen(),
          ),
    ),
  ];
}
