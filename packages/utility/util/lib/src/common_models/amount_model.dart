import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_model.freezed.dart';
part 'amount_model.g.dart';

@freezed
abstract class AmountModel with _$AmountModel {
  const factory AmountModel({required double value, required String currency}) =
      _AmountModel;

  factory AmountModel.fromJson(Map<String, dynamic> json) =>
      _$AmountModelFromJson(json);
  factory AmountModel.empty() => AmountModel(value: 0, currency: 'AED');
}

/// Extension for AmountModel arithmetic operations
extension AmountModelOperations on AmountModel {
  /// overrides + operator
  AmountModel operator +(AmountModel other) {
    if (currency != other.currency) {
      throw Exception('Currencies do not match');
    }
    return AmountModel(value: value + other.value, currency: currency);
  }

  /// overrides - operator
  AmountModel operator -(AmountModel other) {
    if (currency != other.currency) {
      throw Exception('Currencies do not match');
    }
    return AmountModel(value: value - other.value, currency: currency);
  }
}
