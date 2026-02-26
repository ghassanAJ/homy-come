import 'package:booking/src/data/model/res/service_option_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_section_model.freezed.dart';
part 'service_section_model.g.dart';

@freezed
abstract class ServiceSectionModel with _$ServiceSectionModel {
  const factory ServiceSectionModel({
    required String title,
    @JsonKey(name: 'banner_image_url') String? bannerImageUrl,
    @Default([]) List<ServiceOptionModel> options,
  }) = _ServiceSectionModel;

  factory ServiceSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceSectionModelFromJson(json);
}
