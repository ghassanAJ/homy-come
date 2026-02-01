import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'files/authenticationTranslation.i69n.dart';
import 'localization_delegate.dart';

/// [LocalizationsDelegate] for [AuthenticationTranslation].
/// Use with [LocalizationProvider] so routes can access [AuthenticationTranslation]
/// via [BuildContext.loc].
class AuthLocalizationDelegate
    extends LocalizationsDelegate<AuthenticationTranslation> {
  const AuthLocalizationDelegate();

  @override
  Future<AuthenticationTranslation> load(Locale locale) {
    final tr =
        AuthTranslationMap.translation[locale.languageCode]?.call() ??
        AuthTranslationMap.translation['en']!();
    return SynchronousFuture<AuthenticationTranslation>(tr);
  }

  @override
  bool isSupported(Locale locale) =>
      AuthTranslationMap.translation.containsKey(locale.languageCode) ||
      AuthTranslationMap.translation.containsKey('en');

  @override
  bool shouldReload(covariant AuthLocalizationDelegate old) => false;
}
