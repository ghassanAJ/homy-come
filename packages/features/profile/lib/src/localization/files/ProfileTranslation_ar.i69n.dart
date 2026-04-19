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
  DriverProfileProfileTranslation_ar get driverProfile =>
      DriverProfileProfileTranslation_ar(this);
  LabelsProfileTranslation_ar get Labels => LabelsProfileTranslation_ar(this);
  PlaceHolderProfileTranslation_ar get placeHolder =>
      PlaceHolderProfileTranslation_ar(this);
  ReviewsProfileTranslation_ar get reviews =>
      ReviewsProfileTranslation_ar(this);
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
      case 'driverProfile':
        return driverProfile;
      case 'Labels':
        return Labels;
      case 'placeHolder':
        return placeHolder;
      case 'reviews':
        return reviews;
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
  String get myOrder => "طلباتي";
  String get term => "شروط و الاحكام";
  String get myTeam => "فريقي";
  String get memberTeam => "اعضاء الفريق";
  String get working => "يعمل";
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
      case 'myOrder':
        return myOrder;
      case 'term':
        return term;
      case 'myTeam':
        return myTeam;
      case 'memberTeam':
        return memberTeam;
      case 'working':
        return working;
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
  String get savedBeneficiary => "المستفيد المحفوظ";
  String get location => "موقعي";
  String get job => "سجل المهام";
  String get appNotifications => "إشعارات التطبيق";
  String get deleteMyAccount => "حذف حسابي";
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
      case 'job':
        return job;
      case 'appNotifications':
        return appNotifications;
      case 'deleteMyAccount':
        return deleteMyAccount;
      default:
        return super[key];
    }
  }
}

class DriverProfileProfileTranslation_ar
    extends DriverProfileProfileTranslation {
  final ProfileTranslation_ar _parent;
  const DriverProfileProfileTranslation_ar(this._parent) : super(_parent);
  String get settings => "الإعدادات";
  String get trackPerformance => "تتبع أداءك";
  String get orders => "الطلبات";
  String get completed => "المكتمل";
  String get canceledOrder => "الطلبات الملغاة";
  String get punctuality => "الالتزام بالمواعيد";
  String get customerSatisfaction => "رضا العملاء";
  String get logoutConfirmDescription => "هل أنت متأكد أنك تريد تسجيل الخروج؟";
  String get deleteAccountConfirmDescription =>
      "هل أنت متأكد أنك تريد حذف حسابك؟";
  String get language => "اللغة";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'settings':
        return settings;
      case 'trackPerformance':
        return trackPerformance;
      case 'orders':
        return orders;
      case 'completed':
        return completed;
      case 'canceledOrder':
        return canceledOrder;
      case 'punctuality':
        return punctuality;
      case 'customerSatisfaction':
        return customerSatisfaction;
      case 'logoutConfirmDescription':
        return logoutConfirmDescription;
      case 'deleteAccountConfirmDescription':
        return deleteAccountConfirmDescription;
      case 'language':
        return language;
      default:
        return super[key];
    }
  }
}

class LabelsProfileTranslation_ar extends LabelsProfileTranslation {
  final ProfileTranslation_ar _parent;
  const LabelsProfileTranslation_ar(this._parent) : super(_parent);
  String get email => "حساب";
  String get send => "ارسال";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'email':
        return email;
      case 'send':
        return send;
      default:
        return super[key];
    }
  }
}

class PlaceHolderProfileTranslation_ar extends PlaceHolderProfileTranslation {
  final ProfileTranslation_ar _parent;
  const PlaceHolderProfileTranslation_ar(this._parent) : super(_parent);
  String get email => "ادخل حسابك";
  String get note => "اكتب ملاحظاتك";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'email':
        return email;
      case 'note':
        return note;
      default:
        return super[key];
    }
  }
}

class ReviewsProfileTranslation_ar extends ReviewsProfileTranslation {
  final ProfileTranslation_ar _parent;
  const ReviewsProfileTranslation_ar(this._parent) : super(_parent);
  String get title => "التقييمات";
  String get empty => "لا توجد تقييمات بعد";
  String get showMore => "عرض المزيد";
  String get excellent => "ممتاز";
  String get good => "جيد";
  String get average => "متوسط";
  String get belowAverage => "أقل من المتوسط";
  String get poor => "ضعيف";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'empty':
        return empty;
      case 'showMore':
        return showMore;
      case 'excellent':
        return excellent;
      case 'good':
        return good;
      case 'average':
        return average;
      case 'belowAverage':
        return belowAverage;
      case 'poor':
        return poor;
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
