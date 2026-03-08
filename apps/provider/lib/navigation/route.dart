import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_provider/presentation/screens/provider_home_screen.dart';

/// Provider app route paths.
class ProviderPaths {
  ProviderPaths._();

  static const String home = '/home';
  static const String services = '/services';
  static const String bookings = '/bookings';
  static const String profile = '/profile';
  static const String settings = '/settings';
    static const String homeProvider = '/homeProvider';
}

/// Provider app route definitions.
class ProviderRoute {
  ProviderRoute._();

  static List<RouteBase> get routes => [
    GoRoute(
      path: ProviderPaths.home,
      builder: (context, state) =>
          const _PlaceholderScreen(title: 'Home', path: ProviderPaths.home),
    ),
    GoRoute(
      path: ProviderPaths.services,
      builder: (context, state) => const _PlaceholderScreen(
        title: 'Services',
        path: ProviderPaths.services,
      ),
    ),
    GoRoute(
      path: ProviderPaths.bookings,
      builder: (context, state) => const _PlaceholderScreen(
        title: 'Bookings',
        path: ProviderPaths.bookings,
      ),
    ),
    GoRoute(
      path: ProviderPaths.profile,
      builder: (context, state) => const _PlaceholderScreen(
        title: 'Profile',
        path: ProviderPaths.profile,
      ),
    ),
    GoRoute(
      path: ProviderPaths.settings,
      builder: (context, state) => const _PlaceholderScreen(
        title: 'Settings',
        path: ProviderPaths.settings,
      ),
    ),
   GoRoute(
      path: ProviderPaths.homeProvider,
      builder: (context, state) =>ProviderHomeScreen()
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
