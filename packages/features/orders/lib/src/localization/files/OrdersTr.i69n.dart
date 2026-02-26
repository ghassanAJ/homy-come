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

class OrdersTr implements i69n.I69nMessageBundle {
  const OrdersTr();
  TitleOrdersTr get title => TitleOrdersTr(this);
  LabelsOrdersTr get labels => LabelsOrdersTr(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'labels':
        return labels;
      default:
        return key;
    }
  }
}

class TitleOrdersTr implements i69n.I69nMessageBundle {
  final OrdersTr _parent;
  const TitleOrdersTr(this._parent);
  String get serviceType => "Service Type";
  String get inProgess => "In progress";
  String get scheduled => "scheduled";
  String get completed => "complete";
  String get date => "Date";
  String get time => "Time";
  String get address => "Address";
  String get myOrder => "my orders";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'serviceType':
        return serviceType;
      case 'inProgess':
        return inProgess;
      case 'scheduled':
        return scheduled;
      case 'completed':
        return completed;
      case 'date':
        return date;
      case 'time':
        return time;
      case 'address':
        return address;
      case 'myOrder':
        return myOrder;
      default:
        return key;
    }
  }
}

class LabelsOrdersTr implements i69n.I69nMessageBundle {
  final OrdersTr _parent;
  const LabelsOrdersTr(this._parent);
  String get all => "All";
  String get cancel => "cancel";
  String get details => "Details";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'all':
        return all;
      case 'cancel':
        return cancel;
      case 'details':
        return details;
      default:
        return key;
    }
  }
}
