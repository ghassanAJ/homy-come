import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:user/features/booking/presentation/screens/service_details_screen.dart';
import 'package:user/features/booking/presentation/screens/service_details_step1.dart';
import 'package:user/features/booking/presentation/screens/service_details_step2.dart';
import 'package:user/features/booking/presentation/screens/service_details_step3.dart';
import 'package:user/features/booking/presentation/screens/service_details_summary_screen.dart';
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
    return [
      _createDashboardShell(shellNavigatorKey),

      GoRoute(
        path: UserPaths.serviceDetails,
        builder: (context, state) => const ServiceDetailsScreenStep1(),
      ),
      GoRoute(
        path: UserPaths.serviceDetails2,
        builder: (context, state) => const ServiceDetailsStep2(),
      ),
      GoRoute(
        path: UserPaths.serviceDetails3,
        builder: (context, state) => const ServiceDetailsStep3(),
      ),
      GoRoute(
        path: UserPaths.serviceDetailsSummary,
        builder: (context, state) => const ServiceDetailsSummaryScreen(),
      ),
    ];
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
                      Scaffold(body: Center(child: Text('Search'))),
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
              builder: (context, state) => const ServiceDetailsScreen(),
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
                  (context, state) => Scaffold(
                    body: ProfileLocalizationScope(child: ProfileScreen()),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
