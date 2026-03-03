import 'package:booking/booking.dart';
import 'package:booking/src/data/model/res/service_category_model.dart';
import 'package:booking/src/data/model/res/service_option_model.dart';
import 'package:booking/src/data/model/res/service_section_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_details_response_model.freezed.dart';
part 'service_details_response_model.g.dart';

@freezed
abstract class ServiceDetailsResponseModel with _$ServiceDetailsResponseModel {
  const factory ServiceDetailsResponseModel({
    required String id,
    required String title,
    @Default([]) List<ServiceCategoryModel> categories,
    @JsonKey(name: 'featured_option') ServiceOptionModel? featuredOption,
    @Default([]) List<ServiceSectionModel> sections,
  }) = _ServiceDetailsResponseModel;

  factory ServiceDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceDetailsResponseModelFromJson(json);
}

@freezed
abstract class ServicePreviewResponseModel with _$ServicePreviewResponseModel {
  const factory ServicePreviewResponseModel({
    required String id,
    required InfoModel info,
    required int rating,
    required int reviewsCount,
  }) = _ServicePreviewResponseModel;

  factory ServicePreviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ServicePreviewResponseModelFromJson(json);
}
