import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/screens/search_screen.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:util/util.dart';

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
  static const String notifications = '/notifications';
  static const String serviceDetails = '/service-details';
  static const String serviceDetails2 = '/service-details2';
  static const String serviceDetails3 = '/service-details3';
  static const String services = '/services';
  static String serviceDetailsSummarywithid({int? id}) =>
      id == null
          ? '/service-details-summary/:id'
          : '/service-details-summary/$id';
  // static const String serviceDetailsSummary = '/service-details-summary/:id';
  static const String storiesScreen = '/stories-screen';
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
          (context, state) => _PlaceholderScreen(
            title: context.loc<UserTranslation>().navigation.home,
            path: UserPaths.home,
          ),
    ),

    GoRoute(
      path: UserPaths.category,
      builder:
          (context, state) => _PlaceholderScreen(
            title: context.loc<UserTranslation>().navigation.category,
            path: UserPaths.category,
          ),
    ),
    GoRoute(
      path: UserPaths.orders,
      builder:
          (context, state) => _PlaceholderScreen(
            title: context.loc<UserTranslation>().navigation.orders,
            path: UserPaths.orders,
          ),
    ),
    GoRoute(
      path: UserPaths.search,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: UserPaths.profile,
      builder:
          (context, state) => _PlaceholderScreen(
            title: context.loc<UserTranslation>().navigation.profile,
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
      body: Center(child: Text('$title - $path')),
    );
  }
}
