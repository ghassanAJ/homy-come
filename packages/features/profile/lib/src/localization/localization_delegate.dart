import 'files/ProfileTranslation.i69n.dart';
import 'files/ProfileTranslation_ar.i69n.dart';

class ProfileTranslationMap {
  static final Map<String, ProfileTranslation Function()> translation = {
    'en': () => ProfileTranslation(),
    'ar': () => ProfileTranslation_ar(),
  };
}