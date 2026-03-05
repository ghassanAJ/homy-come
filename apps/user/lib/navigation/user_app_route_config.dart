import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:user/features/home/presentation/screens/categories_screen.dart';
import 'package:user/features/home/presentation/screens/search_screen.dart';
import 'package:user/features/home/presentation/screens/services_screen.dart';
import 'package:user/features/home/presentation/screens/stories_screen.dart';
import 'package:user/features/home/presentation/screens/user_home_screen.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:user/localization/user_localization_scope.dart';
import 'package:user/navigation/route.dart';
import 'package:user/navigation/user_navigation_config.dart';
import 'package:util/util.dart';

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
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final id = data['id'] as String;
          return ServiceDetailsScreen(serviceId: int.parse(id));
        },
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
      GoRoute(
        path: UserPaths.storiesScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final pageIndex = data['pageIndex'] as int;
          final storyItems = data['storyItems'] as List<StoryPageData>;
          return StoriesScreen(pageIndex: pageIndex, pages: storyItems);
        },
      ),
      GoRoute(
        path: UserPaths.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: UserPaths.services,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final id = data['id'] as int;
          return ServicesScreen(id: id);
        },
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
        return UserLocalizationScope(
          child: Builder(
            builder: (context) {
              final tr = context.loc<UserTranslation>();
              return DashboardNavigationScaffold(
                navigationShell: navigationShell,
                navigationItems: UserNavigationConfig.items(tr),
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
              path: UserPaths.orders,
              builder:
                  (context, state) => Scaffold(
                    body: Center(
                      child: Text(
                        context.loc<UserTranslation>().navigation.orders,
                      ),
                    ),
                  ),
            ),
          ],
        ),
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
              path: UserPaths.category,
              builder: (context, state) => const CategoriesScreen(),
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
