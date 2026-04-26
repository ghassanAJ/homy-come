import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:notifications/notifications.dart';
import 'package:orders/orders.dart';
import 'package:profile/profile.dart';
import 'package:user/features/home/presentation/screens/categories_screen.dart';
import 'package:user/features/home/presentation/screens/services_screen.dart';
import 'package:user/features/home/presentation/screens/set_location_screen.dart';
import 'package:user/features/home/presentation/screens/stories_screen.dart';
import 'package:user/features/home/presentation/screens/user_home_screen.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';
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
        path: UserPaths.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: UserPaths.serviceDetails,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final id = data['id'] as String;
          final discountCode = data['discountCode'] as String?;
          final discountPercentage = data['discountPercentage'] as double?;
          return ServiceDetailsScreen(
            serviceId: id,
            discountCode: discountCode,
            discountPercentage: discountPercentage,
          );
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
        path: UserPaths.serviceDetailsSummarywithid(),
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ServiceDetailsSummaryScreen(id: id);
        },
      ),
      GoRoute(
        path: UserPaths.storiesScreen,
        parentNavigatorKey: AppRouter.rootNavigatorKey, // 👈 THIS IS THE FIX
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final pageIndex = data['pageIndex'] as int;
          final storyItems = data['storyItems'] as List<StoryPageData>;

          return CustomTransitionPage(
            key: state.pageKey,
            child: StoriesScreen(pageIndex: pageIndex, pages: storyItems),

            // transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(milliseconds: 200),

            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curved = CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              );

              return FadeTransition(
                opacity: curved,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(curved),
                  child: child,
                ),
              );
            },
          );
        },
      ),

      GoRoute(
        path: UserPaths.setLocation,
        builder: (context, state) {
          final currentUser = context.read<AppCubit>().state.user;
          return SelectLocationScreen(
            selectedLocation: UserddressModel(
              latitude: currentUser?.latitude ?? 0, // currentUser?.latitude,
              longitude: currentUser?.longitude ?? 0,
              addressTitle: currentUser?.address,
              id: 1,
            ),
          );
        },
      ),
      GoRoute(
        path: UserPaths.search,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: UserPaths.services,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final id = data['id'] as String;
          final title = data['title'] as String;
          return ServicesScreen(id: id, title: title);
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
              path: UserPaths.home,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const UserHomeScreen(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1), // 👈 bottom to top
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: UserPaths.orders,
              builder:
                  (context, state) =>
                      OrderLocalizationScope(child: MyOrderScreen()),
            ),
          ],
        ),
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       path: UserPaths.category,
        //       builder: (context, state) => const CategoriesScreen(),
        //     ),
        //   ],
        // ),

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
