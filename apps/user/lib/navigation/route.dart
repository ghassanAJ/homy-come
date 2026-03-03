import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// User app route paths.
///
/// Align with [AppPaths] in the authentication package where dashboard
/// and shell routes are configured.
class UserPaths {
  UserPaths._();

  static const String home = '/home';
  static const String category = '/category';
  static const String orders = '/orders';
  static const String search = '/search';
  static const String profile = '/profile';
  static const String serviceDetails = '/service-details';
  static const String serviceDetails2 = '/service-details2';
  static const String serviceDetails3 = '/service-details3';
  static String  serviceDetailsSummarywithid({int? id})=>id==null?'/service-details-summary/:id':'/service-details-summary/$id';
  // static const String serviceDetailsSummary = '/service-details-summary/:id';
}

/// User app route definitions.
///
/// Add user-app-specific routes here. Dashboard and shell tabs are
/// configured in [UserAppRouteConfig] (authentication package).
class UserRoute {
  UserRoute._();

  static List<RouteBase> get routes => [
    GoRoute(
      path: UserPaths.home,
      builder:
          (context, state) =>
              const _PlaceholderScreen(title: 'Home', path: UserPaths.home),
    ),
    GoRoute(
      path: UserPaths.category,
      builder:
          (context, state) => const _PlaceholderScreen(
            title: 'Category',
            path: UserPaths.category,
          ),
    ),
    GoRoute(
      path: UserPaths.orders,
      builder:
          (context, state) =>
              const _PlaceholderScreen(title: 'Orders', path: UserPaths.orders),
    ),
    GoRoute(
      path: UserPaths.search,
      builder:
          (context, state) =>
              const _PlaceholderScreen(title: 'Search', path: UserPaths.search),
    ),
    GoRoute(
      path: UserPaths.profile,

      builder:
          (context, state) => const _PlaceholderScreen(
            title: 'Profile',
            path: UserPaths.profile,
          ),
    ),
  ];
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  final String path;

  const _PlaceholderScreen({required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title — $path')),
    );
  }
}
