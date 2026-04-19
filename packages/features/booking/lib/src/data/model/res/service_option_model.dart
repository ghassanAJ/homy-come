import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_option_model.freezed.dart';
part 'service_option_model.g.dart';

@freezed
abstract class ServiceOptionModel with _$ServiceOptionModel {
  const factory ServiceOptionModel({
    required int id,
    required String title,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required String description,
    @JsonKey(name: 'original_price') required double originalPrice,
    @JsonKey(name: 'discounted_price') required double discountedPrice,
    @Default('AED') String currency,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _ServiceOptionModel;

  factory ServiceOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceOptionModelFromJson(json);
}
