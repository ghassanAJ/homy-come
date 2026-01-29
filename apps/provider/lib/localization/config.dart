import 'package:flutter/material.dart';

class Config {
  static List<Locale> supportedLocales = [Locale('en'), Locale('ar')];
  static Locale defaultLocale = Locale('en');

  /// Get the device locale without context
  static Locale getDeviceLocale() {
    final platformLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final languageCode = platformLocale.languageCode;

    if (supportedLocales.any((locale) => locale.languageCode == languageCode)) {
      return Locale(languageCode);
    }

    return defaultLocale;
  }

  /// Legacy method - use getDeviceLocale() instead when possible
  static Locale getSystemLocale(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (supportedLocales.any(
      (supported) => supported.languageCode == locale.languageCode,
    )) {
      return locale;
    }
    return defaultLocale;
  }
}
