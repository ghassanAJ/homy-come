import 'package:flutter/material.dart';
import 'package:orders/src/localization/files/OrdersTr.i69n.dart';
import 'package:orders/src/localization/order_localization_delegate.dart';

extension OrderTranslationExtension on BuildContext {
  OrdersTr get orderTr => OrderTranslationExtension.loc(this);

  static OrdersTr loc(BuildContext context) {
    return Localizations.of<OrdersTr>(
      context,
      OrdersTr,
    )!;
  }
}

/// Provides [OrderTranslation] to descendants
class OrderLocalizationScope extends StatelessWidget {
  const OrderLocalizationScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      delegates: const [
        OrdersLocalizationDelegate(),
      ],
      child: child,
    );
  }
}