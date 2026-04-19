// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'DesignSystemTranslation.i69n.dart';

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

class DesignSystemTranslation_ar extends DesignSystemTranslation {
  const DesignSystemTranslation_ar();
  DialogDesignSystemTranslation_ar get dialog =>
      DialogDesignSystemTranslation_ar(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'dialog':
        return dialog;
      default:
        return super[key];
    }
  }
}

class DialogDesignSystemTranslation_ar extends DialogDesignSystemTranslation {
  final DesignSystemTranslation_ar _parent;
  const DialogDesignSystemTranslation_ar(this._parent) : super(_parent);
  String get confirm => "تأكيد";
  String get cancel => "إلغاء";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'confirm':
        return confirm;
      case 'cancel':
        return cancel;
      default:
        return super[key];
    }
  }
}
