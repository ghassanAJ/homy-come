import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'files/ProfileTranslation.i69n.dart';
import 'localization_delegate.dart';

/// [LocalizationsDelegate] for [ProfileTranslation].
/// Use with [LocalizationProvider] so routes can access [ProfileTranslation]
/// via [BuildContext.loc].
class ProfileLocalizationDelegate
    extends LocalizationsDelegate<ProfileTranslation> {
  const ProfileLocalizationDelegate();

  @override
  Future<ProfileTranslation> load(Locale locale) {
    final tr =
        ProfileTranslationMap.translation[locale.languageCode]?.call() ??
        ProfileTranslationMap.translation['en']!();
    return SynchronousFuture<ProfileTranslation>(tr);
  }

  @override
  bool isSupported(Locale locale) =>
      ProfileTranslationMap.translation.containsKey(locale.languageCode) ||
      ProfileTranslationMap.translation.containsKey('en');

  @override
  bool shouldReload(covariant ProfileLocalizationDelegate old) => false;
}