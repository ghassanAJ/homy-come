import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:orders/src/presentation/screen/my_order_screen.dart';
import 'package:orders/src/presentation/screen/order_details.dart';
import 'package:orders/src/presentation/screen/today_schedule_screen.dart';
import 'package:user/features/home/presentation/screens/location_directions.dart';

/// Profile route paths
class OrderPaths {
  static const String myOrderscreen = '/My_order_page';
  static const String todayScheduleScreen = '/Today-schedule';
  static const String getDiraction = '/get-diraction';
  static String orderDetailswithid({int? id}) =>
      id == null ? '/order-details/:id' : '/order-details/$id';
}

class OrderRoute {
  static List<RouteBase> get routes => [
    GoRoute(
      path: OrderPaths.myOrderscreen,
      builder:
          (context, state) => OrderLocalizationScope(child: MyOrderScreen()),
    ),
    GoRoute(
      path: OrderPaths.todayScheduleScreen,
      builder:
          (context, state) =>
              OrderLocalizationScope(child: TodayScheduleScreen()),
    ),
    GoRoute(
      path: OrderPaths.todayScheduleScreen,
      builder:
          (context, state) => OrderLocalizationScope(
            child: UIScaffold(body: Container(), withBackgroundGradient: true),
          ),
    ),
    GoRoute(
      path: OrderPaths.getDiraction,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>? ?? {};
        return LocationDirectionsScreen(address: extra['address'] as String);
      },
    ),
    GoRoute(
      path: OrderPaths.orderDetailswithid(),
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return OrderLocalizationScope(child: OrderDetails(id: id));
      },
    ),
  ];
}
