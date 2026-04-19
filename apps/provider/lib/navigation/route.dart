// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:homy_provider/features/home/presentation/screens/provider_home_screen.dart';
// import 'package:homy_provider/localization/provider_localization_scope.dart';

// /// Provider app route paths.
class ProviderPaths {
  ProviderPaths._();

  static const String myTeam = '/my-team';
  static const String myWork = '/my-work';
  static const String services = '/services';
  static const String bookings = '/bookings';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String homeProvider = '/homeProvider';
}

// /// Provider app route definitions.
// class ProviderRoute {
//   ProviderRoute._();

//   static List<RouteBase> get routes => [
//     GoRoute(
//       path: ProviderPaths.home,
//       builder: (context, state) =>
//           const _PlaceholderScreen(title: 'Home', path: ProviderPaths.homeProvider),
//     ),
//     GoRoute(
//       path: ProviderPaths.services,
//       builder: (context, state) => const _PlaceholderScreen(
//         title: 'Services',
//         path: ProviderPaths.services,
//       ),
//     ),
//     GoRoute(
//       path: ProviderPaths.bookings,
//       builder: (context, state) => const _PlaceholderScreen(
//         title: 'Bookings',
//         path: ProviderPaths.bookings,
//       ),
//     ),
//     GoRoute(
//       path: ProviderPaths.profile,
//       builder: (context, state) => const _PlaceholderScreen(
//         title: 'Profile',
//         path: ProviderPaths.profile,
//       ),
//     ),
//     GoRoute(
//       path: ProviderPaths.settings,
//       builder: (context, state) => const _PlaceholderScreen(
//         title: 'Settings',
//         path: ProviderPaths.settings,
//       ),
//     ),
//    GoRoute(
//       path: ProviderPaths.homeProvider,
//       builder: (context, state) =>ProviderLocalizationScope(child: ProviderHomeScreen())
//     ),
//   ];
// }
