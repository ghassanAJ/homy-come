import 'package:authentication/authentication.dart';

// import 'package:authentication/src/presentation/screens/onboarding/splash_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/screens/help_and_support_screen.dart';
import 'package:profile/src/presentation/screens/profile_screen.dart';

/// Profile route paths
class ProfilePaths {
  static const String profile = '/profile_page';
}


class ProfileRoute {

  static List<RouteBase> get routes => [
    GoRoute(
      path: ProfilePaths.profile,
      builder: (context, state) => const ProfileLocalizationScope(
        child: ProfileScreen(),
      ),
    ),
  ];
}