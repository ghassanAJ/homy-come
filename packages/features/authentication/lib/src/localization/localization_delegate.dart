import 'files/authenticationTranslation.i69n.dart';
import 'files/authenticationTranslation_ar.i69n.dart';

class AuthTranslationMap {
  static final Map<String, AuthenticationTranslation Function()> translation = {
    'en': () => AuthenticationTranslation(),
    'ar': () => AuthenticationTranslation_ar(),
  };
}
