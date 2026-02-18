// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class ProfileTranslation implements i69n.I69nMessageBundle {
  const ProfileTranslation();
  ProfileProfileTranslation get profile => ProfileProfileTranslation(this);
  OptionProfileTranslation get option => OptionProfileTranslation(this);
  TermsAndPrivacyProfileTranslation get termsAndPrivacy =>
      TermsAndPrivacyProfileTranslation(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'profile':
        return profile;
      case 'option':
        return option;
      case 'termsAndPrivacy':
        return termsAndPrivacy;
      default:
        return key;
    }
  }
}

class ProfileProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const ProfileProfileTranslation(this._parent);
  String get more => "More";
  String get myProfile => "My Profile";
  String get editProfile => "Edit Profile";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'more':
        return more;
      case 'myProfile':
        return myProfile;
      case 'editProfile':
        return editProfile;
      default:
        return key;
    }
  }
}

class OptionProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const OptionProfileTranslation(this._parent);
  String get help => "Help and Support";
  String get about => "About Us";
  String get contact => "Contact Us";
  String get faq => "FAQ";
  String get notification => "Notification";
  String get logout => "Logout";
  String get deleteAccount => "Delete Account";
  String get savedBeneficiary => "Saved Beneficiary";
  String get location => "My Location";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'help':
        return help;
      case 'about':
        return about;
      case 'contact':
        return contact;
      case 'faq':
        return faq;
      case 'notification':
        return notification;
      case 'logout':
        return logout;
      case 'deleteAccount':
        return deleteAccount;
      case 'savedBeneficiary':
        return savedBeneficiary;
      case 'location':
        return location;
      default:
        return key;
    }
  }
}

class TermsAndPrivacyProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const TermsAndPrivacyProfileTranslation(this._parent);
  String get termsOfUse => "Terms of use";
  String get and => "And";
  String get privacyPolicy => "privacy Policy";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'termsOfUse':
        return termsOfUse;
      case 'and':
        return and;
      case 'privacyPolicy':
        return privacyPolicy;
      default:
        return key;
    }
  }
}
