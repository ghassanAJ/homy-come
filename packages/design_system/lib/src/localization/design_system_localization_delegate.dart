import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'files/DesignSystemTranslation.i69n.dart';
import 'localization_delegate.dart';

class DesignSystemLocalizationDelegate
    extends LocalizationsDelegate<DesignSystemTranslation> {
  const DesignSystemLocalizationDelegate();

  @override
  Future<DesignSystemTranslation> load(Locale locale) {
    final tr =
        DesignSystemTranslationMap.translation[locale.languageCode]?.call() ??
        DesignSystemTranslationMap.translation['en']!();
    return SynchronousFuture<DesignSystemTranslation>(tr);
  }

  @override
  bool isSupported(Locale locale) =>
      DesignSystemTranslationMap.translation.containsKey(locale.languageCode) ||
      DesignSystemTranslationMap.translation.containsKey('en');

  @override
  bool shouldReload(
    covariant DesignSystemLocalizationDelegate old,
  ) => false;
}
