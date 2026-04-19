import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:driver/navigation/driver_app_route_config.dart';
import 'package:driver/navigation/route.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_provider/navigation/provider_app_route_config.dart';
import 'package:homy_provider/navigation/route.dart';
import 'package:injectable/injectable.dart';
import 'package:orders/orders.dart';
import 'package:profile/src/navigation/router.dart';
import 'package:user/navigation/route.dart';
import 'package:user/navigation/user_app_route_config.dart';

@lazySingleton
class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter createUserRouter(AppCubit appCubit) {
    return _buildBaseRoute(
      appCubit,
      UserAppRouteConfig.createRoutes(shellNavigatorKey),
      UserPaths.home,
    );
  }

  static GoRouter createDriverRouter(AppCubit appCubit) {
    return _buildBaseRoute(
      appCubit,
      DriverAppRouteConfig.createRoutes(shellNavigatorKey),
      DriverPaths.home,
    );
  }

  static GoRouter createProviderRouter(AppCubit appCubit) {
    return _buildBaseRoute(
      appCubit,
      ProviderAppRouteConfig.createRoutes(shellNavigatorKey),
      ProviderPaths.homeProvider,
    );
  }

  static GoRouter _buildBaseRoute(
    AppCubit appCubit,
    List<RouteBase> routes,
    String dashbpardPath,
  ) {
    return GoRouter(
      initialLocation: AuthenticationPaths.splash,
      navigatorKey: rootNavigatorKey,
      redirectLimit: 5,
      debugLogDiagnostics: kDebugMode,
      refreshListenable: AppCubitListenable(appCubit),
      redirect:
          (context, state) => AppRouterGuard.handleRedirect(
            state,
            appCubit.state,
            dashbpardPath,
          ),
      routes: [
        ...AuthenticationRoute.routes,
        ...routes,
        ...ProfileRoute.routes,
        ...OrderRoute.routes,
        // ...ProviderRoute.routes,
      ],
    );
  }
}
