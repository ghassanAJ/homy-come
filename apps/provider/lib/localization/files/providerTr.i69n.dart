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

class ProviderTr implements i69n.I69nMessageBundle {
  const ProviderTr();
  TitleProviderTr get title => TitleProviderTr(this);
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
        return key;
    }
  }
}

class TitleProviderTr implements i69n.I69nMessageBundle {
  final ProviderTr _parent;
  const TitleProviderTr(this._parent);
  String get money => "Money";
  String get finacial => "Finacial";
  String get earnedMonth => "Earned this month";
  String get bankTransfers => "Banks Transfers";
  String get success => "Success";
  String get inProgerss => "In Progress";
  String get uncoming => "Upcoming";
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
        return key;
    }
  }
}
