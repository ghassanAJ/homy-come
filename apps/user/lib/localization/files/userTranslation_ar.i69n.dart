// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'userTranslation.i69n.dart';

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

class UserTranslation_ar extends UserTranslation {
  const UserTranslation_ar();
  HomeUserTranslation_ar get home => HomeUserTranslation_ar(this);
  NavigationUserTranslation_ar get navigation =>
      NavigationUserTranslation_ar(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'home':
        return home;
      case 'navigation':
        return navigation;
      default:
        return super[key];
    }
  }
}

class HomeUserTranslation_ar extends HomeUserTranslation {
  final UserTranslation_ar _parent;
  const HomeUserTranslation_ar(this._parent) : super(_parent);
  String get offersNews => "العروض والأخبار";
  String get category => "الفئات";
  String get storiesOffers => "القصص والعروض";
  String get generalCleaning => "التنظيف العام";
  String get plumberServices => "خدمات السباكة";
  String get otherServices => "خدمات أخرى";
  String get seeAll => "عرض الكل";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'offersNews':
        return offersNews;
      case 'category':
        return category;
      case 'storiesOffers':
        return storiesOffers;
      case 'generalCleaning':
        return generalCleaning;
      case 'plumberServices':
        return plumberServices;
      case 'otherServices':
        return otherServices;
      case 'seeAll':
        return seeAll;
      default:
        return super[key];
    }
  }
}

class NavigationUserTranslation_ar extends NavigationUserTranslation {
  final UserTranslation_ar _parent;
  const NavigationUserTranslation_ar(this._parent) : super(_parent);
  String get search => "بحث";
  String get orders => "الطلبات";
  String get home => "الرئيسية";
  String get category => "الفئات";
  String get profile => "الملف الشخصي";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'search':
        return search;
      case 'orders':
        return orders;
      case 'home':
        return home;
      case 'category':
        return category;
      case 'profile':
        return profile;
      default:
        return super[key];
    }
  }
}
