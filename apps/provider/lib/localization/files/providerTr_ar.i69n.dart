// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'providerTr.i69n.dart';

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

class ProviderTr_ar extends ProviderTr {
  const ProviderTr_ar();
  TitleProviderTr_ar get title => TitleProviderTr_ar(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      default:
        return super[key];
    }
  }
}

class TitleProviderTr_ar extends TitleProviderTr {
  final ProviderTr_ar _parent;
  const TitleProviderTr_ar(this._parent) : super(_parent);
  String get money => "النقود";
  String get finacial => "مالية";
  String get earnedMonth => "مكاسب هذا الشهر";
  String get bankTransfers => "تحويلات المصرفية";
  String get success => "نجاح";
  String get inProgerss => "قيد التنفيذ";
  String get uncoming => "القادم";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'money':
        return money;
      case 'finacial':
        return finacial;
      case 'earnedMonth':
        return earnedMonth;
      case 'bankTransfers':
        return bankTransfers;
      case 'success':
        return success;
      case 'inProgerss':
        return inProgerss;
      case 'uncoming':
        return uncoming;
      default:
        return super[key];
    }
  }
}
