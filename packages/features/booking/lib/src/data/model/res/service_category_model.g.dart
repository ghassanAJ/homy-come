// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceCategoryModel _$ServiceCategoryModelFromJson(
  Map<String, dynamic> json,
) => _ServiceCategoryModel(
  id: json['id'] as String,
  name: json['name'] as String,
  servicesCount: (json['servicesCount'] as num).toInt(),
  imageUrl: json['image_url'] as String?,
  servicePreviews:
      (json['servicePreviews'] as List<dynamic>?)
          ?.map(
            (e) =>
                ServicePreviewResponseModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceCategoryModelToJson(
  _ServiceCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'servicesCount': instance.servicesCount,
  'image_url': instance.imageUrl,
  'servicePreviews': instance.servicePreviews,
};
