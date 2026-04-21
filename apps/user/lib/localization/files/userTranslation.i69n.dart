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

class UserTranslation implements i69n.I69nMessageBundle {
  const UserTranslation();
  HomeUserTranslation get home => HomeUserTranslation(this);
  NavigationUserTranslation get navigation => NavigationUserTranslation(this);
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
        return key;
    }
  }
}

class HomeUserTranslation implements i69n.I69nMessageBundle {
  final UserTranslation _parent;
  const HomeUserTranslation(this._parent);
  String get offersNews => "Offers & News";
  String get category => "Category";
  String get storiesOffers => "Stories & Offers";
  String get generalCleaning => "General Cleaning";
  String get plumberServices => "Plumber Services";
  String get otherServices => "Other Services";
  String get seeAll => "See All";
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
        return key;
    }
  }
}

class NavigationUserTranslation implements i69n.I69nMessageBundle {
  final UserTranslation _parent;
  const NavigationUserTranslation(this._parent);
  String get search => "Search";
  String get orders => "Bookings";
  String get home => "Home";
  String get category => "Category";
  String get profile => "Profile";
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
        return key;
    }
  }
}
