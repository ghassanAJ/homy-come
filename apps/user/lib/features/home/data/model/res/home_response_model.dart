import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_response_model.freezed.dart';
part 'home_response_model.g.dart';

@freezed
abstract class HomeResponseModel with _$HomeResponseModel {
  const factory HomeResponseModel({
    @Default([]) List<ServiceCategoryModel> categories,
    @Default([]) List<OfferModel> offers,
    @Default([]) List<OfferModel> sliders,
  }) = _HomeResponseModel;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);
}

@freezed
abstract class OfferModel with _$OfferModel {
  const factory OfferModel({
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'service_id') String? serviceId,
    // ignore: invalid_annotation_target
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
