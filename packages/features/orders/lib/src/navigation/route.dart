
import 'package:go_router/go_router.dart';
import 'package:orders/src/localization/order_localization_scope.dart';
import 'package:orders/src/presentation/screen/my_order_screen.dart';


/// Profile route paths
class OrderPaths {
  static const String myOrderscreen = '/My_order_page';

}

class OrderRoute {
  static List<RouteBase> get routes => [
    GoRoute(
      path: OrderPaths.myOrderscreen,
      builder:
          (context, state) =>
              const OrderLocalizationScope(child: MyOrderScreen()),
    ),

  ];
}
