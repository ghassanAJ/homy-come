// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddOnCategoryModel _$AddOnCategoryModelFromJson(Map<String, dynamic> json) =>
    _AddOnCategoryModel(
      id: (json['id'] as num).toInt(),
      documentId: json['documentId'] as String,
      services:
          (json['add_on'] as List<dynamic>?)
              ?.map(
                (e) => AddOnServiceModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      info:
          json['info'] == null
              ? null
              : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOnCategoryModelToJson(_AddOnCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'add_on': instance.services,
      'info': instance.info,
    };
