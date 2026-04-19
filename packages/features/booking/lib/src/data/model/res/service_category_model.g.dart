// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceCategoryModel _$ServiceCategoryModelFromJson(
  Map<String, dynamic> json,
) => _ServiceCategoryModel(
  id: (json['id'] as num).toInt(),
  documentId: json['documentId'] as String,
  info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  servicesCount: (json['servicesCount'] as num?)?.toInt() ?? 0,
  services:
      (json['services'] as List<dynamic>?)
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
  'documentId': instance.documentId,
  'info': instance.info,
  'servicesCount': instance.servicesCount,
  'services': instance.services,
};
