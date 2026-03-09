

import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:homy_provider/localization/files/providerTr_ar.i69n.dart';

class ProviderTranslationMap {
  static final Map<String, ProviderTr Function()> translation = {
    'en': () => ProviderTr(),
    'ar': () => ProviderTr_ar(),
  };
}
