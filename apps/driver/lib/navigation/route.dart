import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Driver app route paths.
class DriverPaths {
  DriverPaths._();

  static const String home = '/home';
  static const String myTeam = '/my-team';
  static const String profile = '/profile';
}

/// Driver app route definitions.
class DriverRoute {
  DriverRoute._();

  static List<RouteBase> get routes => [
    GoRoute(
      path: DriverPaths.home,
      builder:
          (context, state) =>
              const _PlaceholderScreen(title: 'Home', path: DriverPaths.home),
    ),
    GoRoute(
      path: DriverPaths.myTeam,
      builder:
          (context, state) => const _PlaceholderScreen(
            title: 'My Team',
            path: DriverPaths.myTeam,
          ),
    ),

    GoRoute(
      path: DriverPaths.profile,
      builder:
          (context, state) => const _PlaceholderScreen(
            title: 'Profile',
            path: DriverPaths.profile,
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
