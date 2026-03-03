import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_price_model.freezed.dart';
part 'service_price_model.g.dart';

@freezed
abstract class ServicePriceModel with _$ServicePriceModel {
  const factory ServicePriceModel({
    String? id,
    @JsonKey(name: 'current_price') num? currentPrice,
    @JsonKey(name: 'new_price') num? newPrice,
    String? currency,
  }) = _ServicePriceModel;

  factory ServicePriceModel.fromJson(Map<String, dynamic> json) =>
      _$ServicePriceModelFromJson(json);
}
