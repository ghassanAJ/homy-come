import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:driver/navigation/driver_app_route_config.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_provider/navigation/provider_app_route_config.dart';
import 'package:injectable/injectable.dart';
import 'package:user/navigation/user_app_route_config.dart';

@lazySingleton
class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  @factory
  static GoRouter createUserRouter(AppCubit appCubit) {
    return _buildBaseRoute(
      appCubit,
      UserAppRouteConfig.createRoutes(shellNavigatorKey),
    );
  }

  static GoRouter buildDriverRouter(AppCubit appCubit) {
    return _buildBaseRoute(
      appCubit,
      DriverAppRouteConfig.createRoutes(shellNavigatorKey),
    );
  }

  static GoRouter buildProviderRouter(AppCubit appCubit) {
    return _buildBaseRoute(
      appCubit,
      ProviderAppRouteConfig.createRoutes(shellNavigatorKey),
    );
  }

  static GoRouter _buildBaseRoute(AppCubit appCubit, List<RouteBase> routes) {
    return GoRouter(
      initialLocation: AuthenticationPaths.splash,
      navigatorKey: rootNavigatorKey,
      redirectLimit: 5,
      debugLogDiagnostics: true,
      refreshListenable: AppCubitListenable(appCubit),
      redirect:
          (context, state) =>
              AppRouterGuard.handleRedirect(state, appCubit.state),
      routes: [...AuthenticationRoute.routes, ...routes],
    );
  }
}
