import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/src/widgets/shared/dashboard_navigation_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';
import 'package:user/navigation/user_navigation_config.dart';

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
        return DashboardNavigationScaffold(
          navigationShell: navigationShell,
          navigationItems: UserNavigationConfig.items,
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
              path: UserPaths.search,
              builder:
                  (context, state) =>
                      Scaffold(body: Center(child: Text('Search'))),///[هون]
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.orders,
              builder:
                  (context, state) =>
                      Scaffold(body: Center(child: Text('Orders'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.home,
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.category,
              builder:
                  (context, state) =>
                      Scaffold(body: Center(child: Text('Category'))),
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
