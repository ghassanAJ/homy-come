import 'package:go_router/go_router.dart';
import 'package:notifications/src/presentation/screens/notifications_screen.dart';

class NotificationsPaths {
  static const String notifications = '/notifications';
}

class NotificationsRoute {
  static List<RouteBase> get routes => [
    GoRoute(
      path: NotificationsPaths.notifications,
      builder: (context, state) => const NotificationsScreen(),
    ),
  ];
}
