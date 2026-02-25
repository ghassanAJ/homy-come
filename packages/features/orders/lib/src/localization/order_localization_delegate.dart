import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:orders/src/localization/files/OrdersTr.i69n.dart';
import 'localization_delegate.dart';

/// [LocalizationsDelegate] for [OrdersTr].
/// Use with [LocalizationProvider] so routes can access [OrdersTr]
/// via [BuildContext.loc].
class OrdersLocalizationDelegate
    extends LocalizationsDelegate<OrdersTr> {
  const OrdersLocalizationDelegate();

  @override
  Future<OrdersTr> load(Locale locale) {
    final tr =
        OrdersTranslationMap.translation[locale.languageCode]?.call() ??
        OrdersTranslationMap.translation['en']!();
    return SynchronousFuture<OrdersTr>(tr);
  }

  @override
  bool isSupported(Locale locale) =>
      OrdersTranslationMap.translation.containsKey(locale.languageCode) ||
      OrdersTranslationMap.translation.containsKey('en');

  @override
  bool shouldReload(covariant OrdersLocalizationDelegate old) => false;
}