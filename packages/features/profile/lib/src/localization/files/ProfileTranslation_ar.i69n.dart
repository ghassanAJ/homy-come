// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'ProfileTranslation.i69n.dart';

String get _languageCode => 'ar';
String get _localeName => 'ar';

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

class ProfileTranslation_ar extends ProfileTranslation {
  const ProfileTranslation_ar();
  ProfileProfileTranslation_ar get profile =>
      ProfileProfileTranslation_ar(this);
  OptionProfileTranslation_ar get option => OptionProfileTranslation_ar(this);
  TermsAndPrivacyProfileTranslation_ar get termsAndPrivacy =>
      TermsAndPrivacyProfileTranslation_ar(this);
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
        return super[key];
    }
  }
}

class ProfileProfileTranslation_ar extends ProfileProfileTranslation {
  final ProfileTranslation_ar _parent;
  const ProfileProfileTranslation_ar(this._parent) : super(_parent);
  String get more => "المزيد";
  String get myProfile => "معلوماتي";
  String get editProfile => "تعديل الملف الشخصي";
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
        return super[key];
    }
  }
}

class OptionProfileTranslation_ar extends OptionProfileTranslation {
  final ProfileTranslation_ar _parent;
  const OptionProfileTranslation_ar(this._parent) : super(_parent);
  String get help => "مساعدة و دعم";
  String get about => "حول التطبيق";
  String get contact => "اتصل بنا";
  String get faq => "اسئلة شائعة";
  String get notification => "اشعارات";
  String get logout => "تسجيل خروج";
  String get deleteAccount => "حذف الحساب";
  String get savedBeneficiary => "Saved Beneficiary";
  String get location => "موقعي";
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
        return super[key];
    }
  }
}

class TermsAndPrivacyProfileTranslation_ar
    extends TermsAndPrivacyProfileTranslation {
  final ProfileTranslation_ar _parent;
  const TermsAndPrivacyProfileTranslation_ar(this._parent) : super(_parent);
  String get termsOfUse => "شروط الاستخدام";
  String get and => "و";
  String get privacyPolicy => "سياسة الخصوصية";
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
        return super[key];
    }
  }
}
