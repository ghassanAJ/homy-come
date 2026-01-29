import 'package:authentication/authentication.dart';
import 'package:authentication/src/navigation/dashboard_navigation_scaffold.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_provider/navigation/provider_navigation_config.dart';
import 'package:homy_provider/navigation/route.dart';

/// Configuration for provider app routes.
///
/// Provides organized route definitions with a dashboard shell and bottom nav.
class ProviderAppRouteConfig {
  /// Creates all route configurations for the app
  static List<RouteBase> createRoutes(
    GlobalKey<NavigatorState> shellNavigatorKey,
  ) {
    return [_createDashboardShell(shellNavigatorKey)];
  }

  /// Dashboard shell with bottom navigation and tab routes
  static StatefulShellRoute _createDashboardShell(
    GlobalKey<NavigatorState> shellNavigatorKey,
  ) {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardNavigationScaffold(
          navigationShell: navigationShell,
          navigationItems: ProviderNavigationConfig.items,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProviderPaths.home,
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
              path: ProviderPaths.services,
              builder:
                  (context, state) =>
                      Scaffold(body: Center(child: Text('Services'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProviderPaths.bookings,
              builder:
                  (context, state) =>
                      Scaffold(body: Center(child: Text('Bookings'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProviderPaths.profile,
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
