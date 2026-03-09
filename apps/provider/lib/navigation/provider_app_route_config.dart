import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_provider/features/home/presentation/screens/provider_home_screen.dart';
import 'package:homy_provider/localization/provider_localization_scope.dart';
import 'package:homy_provider/navigation/provider_navigation_config.dart';
import 'package:homy_provider/navigation/route.dart';
import 'package:profile/profile.dart';

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
          branchPaths: const [
            ProviderPaths.homeProvider,
            ProviderPaths.services,
            ProviderPaths.bookings,
            ProviderPaths.profile,
          ],
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProviderPaths.homeProvider,
              builder:
                  (context, state) => ProviderLocalizationScope(child: ProviderHomeScreen())
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
                  (context, state) => const ProfileLocalizationScope(
                    child: ProviderProfileScreen(),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
