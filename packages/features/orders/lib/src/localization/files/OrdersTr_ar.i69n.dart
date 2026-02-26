// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'OrdersTr.i69n.dart';

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

class OrdersTr_ar extends OrdersTr {
  const OrdersTr_ar();
  TitleOrdersTr_ar get title => TitleOrdersTr_ar(this);
  LabelsOrdersTr_ar get labels => LabelsOrdersTr_ar(this);
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
        return super[key];
    }
  }
}

class TitleOrdersTr_ar extends TitleOrdersTr {
  final OrdersTr_ar _parent;
  const TitleOrdersTr_ar(this._parent) : super(_parent);
  String get serviceType => "نوع الخدمة";
  String get inProgess => "قيد التقدم";
  String get scheduled => "scheduled";
  String get completed => "مكتملة";
  String get date => "تاريخ";
  String get time => "وقت";
  String get address => "عنوان";
  String get myOrder => "طلباتي";
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
        return super[key];
    }
  }
}

class LabelsOrdersTr_ar extends LabelsOrdersTr {
  final OrdersTr_ar _parent;
  const LabelsOrdersTr_ar(this._parent) : super(_parent);
  String get all => "كل";
  String get cancel => "الغاء";
  String get details => "تفاصيل";
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
        return super[key];
    }
  }
}
