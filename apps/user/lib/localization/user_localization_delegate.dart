import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';

import 'localization_delegate.dart';

class UserLocalizationDelegate extends LocalizationsDelegate<UserTranslation> {
  const UserLocalizationDelegate();

  @override
  Future<UserTranslation> load(Locale locale) {
    final tr =
        UserTranslationMap.translation[locale.languageCode]?.call() ??
        UserTranslationMap.translation['en']!();
    return SynchronousFuture<UserTranslation>(tr);
  }

  @override
  bool isSupported(Locale locale) =>
      UserTranslationMap.translation.containsKey(locale.languageCode) ||
      UserTranslationMap.translation.containsKey('en');

  @override
  bool shouldReload(covariant UserLocalizationDelegate old) => false;
}
