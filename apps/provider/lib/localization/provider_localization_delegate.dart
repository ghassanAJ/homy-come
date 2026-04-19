import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';


import 'localization_delegate.dart';

/// [LocalizationsDelegate] for [ProviderTr].
/// Use with [LocalizationProvider] so routes can access [ProviderTr]
/// via [BuildContext.loc].
class ProviderLocalizationDelegate
    extends LocalizationsDelegate<ProviderTr> {
  const ProviderLocalizationDelegate();

  @override
  Future<ProviderTr> load(Locale locale) {
    final tr =
        ProviderTranslationMap.translation[locale.languageCode]?.call() ??
        ProviderTranslationMap.translation['en']!();
    return SynchronousFuture<ProviderTr>(tr);
  }

  @override
  bool isSupported(Locale locale) =>
      ProviderTranslationMap.translation.containsKey(locale.languageCode) ||
      ProviderTranslationMap.translation.containsKey('en');

  @override
  bool shouldReload(covariant ProviderLocalizationDelegate old) => false;
}
