import 'files/DesignSystemTranslation.i69n.dart';
import 'files/DesignSystemTranslation_ar.i69n.dart';

class DesignSystemTranslationMap {
  static final Map<String, DesignSystemTranslation Function()> translation = {
    'en': () => const DesignSystemTranslation(),
    'ar': () => const DesignSystemTranslation_ar(),
  };
}
