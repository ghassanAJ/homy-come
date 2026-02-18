import 'package:authentication/authentication.dart';

import 'package:authentication/src/presentation/screens/onboarding/splash_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:profile/src/presentation/screens/help_and_support_screen.dart';
import 'package:profile/src/presentation/screens/profile_page.dart';

/// Authentication route paths
class ProfilePaths {
  static const String profile = '/profile_page';
}

// class AuthRouteParams {
//   AuthRouteParams._();
//   static const String userInput = 'userInput';
//   static const String verificationId = 'verificationId';
//   static const String userType = 'userType';
//   static const String userRole = 'userRole';
// }

class ProfileRoute {

  static List<RouteBase> get routes => [
    // ShellProviderRoute(
      // providers: (context, state) => [const AuthLocalizationScope()],
      // builder: (context, state, child) => child, 
        GoRoute(
          path: AuthenticationPaths.profile,
          builder: (context, state) => const HelpAndSupportScreen(),
        ),
    
    // ),
  ];
}
