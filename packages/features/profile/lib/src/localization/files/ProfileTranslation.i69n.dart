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
  DriverProfileProfileTranslation get driverProfile =>
      DriverProfileProfileTranslation(this);
  LabelsProfileTranslation get Labels => LabelsProfileTranslation(this);
  PlaceHolderProfileTranslation get placeHolder =>
      PlaceHolderProfileTranslation(this);
  ReviewsProfileTranslation get reviews => ReviewsProfileTranslation(this);
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
  String get myOrder => "my order";
  String get term => "terms and condition";
  String get myTeam => "My Team";
  String get memberTeam => "Team Members";
  String get working => "Working";
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
  String get job => "Job history";
  String get appNotifications => "App Notifications";
  String get deleteMyAccount => "Delete my account";
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
        return key;
    }
  }
}

class DriverProfileProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const DriverProfileProfileTranslation(this._parent);
  String get settings => "Settings";
  String get trackPerformance => "Track your performance";
  String get orders => "Orders";
  String get completed => "Completed";
  String get canceledOrder => "Canceled Order";
  String get punctuality => "Punctuality";
  String get customerSatisfaction => "Customer satisfaction";
  String get logoutConfirmDescription => "Are you sure you want to log out?";
  String get deleteAccountConfirmDescription =>
      "Are you sure you want to delete your account?";
  String get language => "Language";
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
        return key;
    }
  }
}

class LabelsProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const LabelsProfileTranslation(this._parent);
  String get email => "Email";
  String get send => "Send";
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
        return key;
    }
  }
}

class PlaceHolderProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const PlaceHolderProfileTranslation(this._parent);
  String get email => "write your email";
  String get note => "write your note";
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
        return key;
    }
  }
}

class ReviewsProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const ReviewsProfileTranslation(this._parent);
  String get title => "Reviews";
  String get empty => "No reviews yet";
  String get showMore => "Show more";
  String get excellent => "Excellent";
  String get good => "Good";
  String get average => "Average";
  String get belowAverage => "Below Average";
  String get poor => "Poor";
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
        return key;
    }
  }
}

class TermsAndPrivacyProfileTranslation implements i69n.I69nMessageBundle {
  final ProfileTranslation _parent;
  const TermsAndPrivacyProfileTranslation(this._parent);
  String get termsOfUse => "Terms of use";
  String get and => "And";
  String get privacyPolicy => "Privacy Policy";
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
