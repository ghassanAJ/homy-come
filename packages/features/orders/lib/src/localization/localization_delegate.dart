import 'package:orders/src/localization/files/OrdersTr.i69n.dart';
import 'package:orders/src/localization/files/OrdersTr_ar.i69n.dart';



class OrdersTranslationMap {
  static final Map<String, OrdersTr Function()> translation = {
    'en': () => OrdersTr(),
    'ar': () => OrdersTr_ar(),
  };
}