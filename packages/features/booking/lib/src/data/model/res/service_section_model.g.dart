// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceSectionModel _$ServiceSectionModelFromJson(Map<String, dynamic> json) =>
    _ServiceSectionModel(
      title: json['title'] as String,
      bannerImageUrl: json['banner_image_url'] as String?,
      options:
          (json['options'] as List<dynamic>?)
              ?.map(
                (e) => ServiceOptionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ServiceSectionModelToJson(
  _ServiceSectionModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'banner_image_url': instance.bannerImageUrl,
  'options': instance.options,
};
