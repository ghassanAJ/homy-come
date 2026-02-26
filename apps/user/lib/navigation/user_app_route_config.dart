import 'package:design_system/src/widgets/shared/dashboard_navigation_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:user/localization/user_localization_scope.dart';
import 'package:user/navigation/route.dart';
import 'package:user/navigation/user_navigation_config.dart';
import 'package:user/presentation/screens/home/home_screen.dart';
import 'package:util/util.dart';
/// Configuration for all app routes
///
/// Provides organized route definitions grouped by feature area.
class UserAppRouteConfig {
  /// Creates all route configurations for the app
  static List<RouteBase> createRoutes(
    GlobalKey<NavigatorState> shellNavigatorKey,
  ) {
    return [_createDashboardShell(shellNavigatorKey)];
  }

  /// Dashboard shell with bottom navigation and tab routes
  /// Uses StatefulShellRoute to preserve state when switching tabs
  static StatefulShellRoute _createDashboardShell(
    GlobalKey<NavigatorState> shellNavigatorKey,
  ) {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return UserLocalizationScope(
          child: Builder(
            builder: (context) {
              final tr = context.loc<UserTranslation>();
              return DashboardNavigationScaffold(
                navigationShell: navigationShell,
                navigationItems: UserNavigationConfig.items(tr),
                branchPaths: const [
                  UserPaths.home,
                  UserPaths.search,
                  UserPaths.orders,
                  UserPaths.category,
                  UserPaths.profile,
                ],
              );
            },
          ),
        );

        // return DashboardNavigationScaffold(navigationShell: navigationShell);
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.home,
              builder: (context, state) => const UserHomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.search,
              builder: (context, state) => Scaffold(
                body: Center(
                  child:
                      Text(context.loc<UserTranslation>().navigation.search),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.orders,
              builder: (context, state) => Scaffold(
                body: Center(
                  child:
                      Text(context.loc<UserTranslation>().navigation.orders),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.category,
              builder: (context, state) => Scaffold(
                body: Center(
                  child:
                      Text(context.loc<UserTranslation>().navigation.category),
                ),
              ),
            ),
          ],
        ),

        // Profile tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.profile,
              name: 'profile',
              builder:
                  (context, state) =>
                      Scaffold(body: ProfileLocalizationScope(child: ProfileScreen()),)
            ),
          ],
        ),
      ],
    );
  }
}
