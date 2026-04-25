import 'package:design_system/design_system.dart';
import 'package:driver/navigation/driver_navigation_config.dart';
import 'package:driver/navigation/route.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/orders.dart';
import 'package:profile/profile.dart';

/// Configuration for all app routes
///
/// Provides organized route definitions grouped by feature area.
class DriverAppRouteConfig {
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
        return DashboardNavigationScaffold(
          navigationShell: navigationShell,
          navigationItems: DriverNavigationConfig.items,
        );

        // return DashboardNavigationScaffold(navigationShell: navigationShell);
      },

      branches: [
        // Home tab
        // StatefulShellBranch(routes: [...DashboardRoute.routes]),
        // Tasks tab
        // StatefulShellBranch(routes: [TaskRoute.router]),
        // Invest tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: DriverPaths.home,
              builder: (context, state) => TodayScheduleScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: DriverPaths.myTeam,
              builder: (context, state) => MyTeamScreen(),
            ),
          ],
        ),
        // Profile tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: DriverPaths.profile,
              name: 'profile',
              builder:
                  (context, state) => const ProfileLocalizationScope(
                    child: DriverProfileScreen(),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
