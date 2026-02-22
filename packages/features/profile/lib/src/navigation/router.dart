import 'package:authentication/authentication.dart';

// import 'package:authentication/src/presentation/screens/onboarding/splash_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/screens/about_app_screen.dart';
import 'package:profile/src/presentation/screens/help_and_support_screen.dart';
import 'package:profile/src/presentation/screens/profile_screen.dart';
import 'package:profile/src/presentation/screens/terms_and_condition.dart';

/// Profile route paths
class ProfilePaths {
  static const String profile = '/profile_page';
  static const String myOrder = '/my_order_screen';
  static const String termsAndCondition = '/term_and_condition_screen';
  static const String aboutApp = '/about_app_screen';
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
  ];
}
