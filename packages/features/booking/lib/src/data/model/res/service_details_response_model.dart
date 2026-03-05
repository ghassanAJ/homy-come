import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_details_response_model.freezed.dart';
part 'service_details_response_model.g.dart';

@freezed
abstract class ServiceDetailsResponseModel with _$ServiceDetailsResponseModel {
  const factory ServiceDetailsResponseModel({
    required String id,
    required int rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    required InfoModel info,
    required ServicePriceModel price,
    @Default([]) List<AddOnCategoryModel> categories,
  }) = _ServiceDetailsResponseModel;

  factory ServiceDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceDetailsResponseModelFromJson(json);
}

@freezed
abstract class ServicePreviewResponseModel with _$ServicePreviewResponseModel {
  const factory ServicePreviewResponseModel({
    required String id,
    required InfoModel info,
    @JsonKey(name: 'price') required ServicePriceModel priceModel,
    required int rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
  }) = _ServicePreviewResponseModel;

  factory ServicePreviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ServicePreviewResponseModelFromJson(json);
}
