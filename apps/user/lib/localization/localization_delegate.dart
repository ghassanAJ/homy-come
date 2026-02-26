
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:user/localization/files/userTranslation_ar.i69n.dart';

class UserTranslationMap {
  static final Map<String, UserTranslation Function()> translation = {
    'en': () => const UserTranslation(),
    'ar': () => const UserTranslation_ar(),
  };
}
