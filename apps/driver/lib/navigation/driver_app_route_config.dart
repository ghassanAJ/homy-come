import 'package:authentication/authentication.dart';
import 'package:authentication/src/navigation/dashboard_navigation_scaffold.dart';
import 'package:design_system/design_system.dart';
import 'package:driver/navigation/driver_navigation_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';

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
              path: DriverPaths.myTeam,
              builder:
                  (context, state) =>
                      Scaffold(body: Center(child: Text('My Team'))),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: DriverPaths.home,
              builder:
                  (context, state) => Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Home'),
                          UIButton.primary(
                            label: 'logout',
                            onPressed: () {
                              context.read<AuthUserBloc>().add(Logout());
                            },
                          ),
                        ],
                      ),
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
                      Scaffold(body: Center(child: Text('Profile'))),
            ),
          ],
        ),
      ],
    );
  }
}
