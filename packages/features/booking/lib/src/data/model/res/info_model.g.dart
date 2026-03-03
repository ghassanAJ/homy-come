// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceInfoModel _$ServiceInfoModelFromJson(Map<String, dynamic> json) =>
    _ServiceInfoModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ServiceInfoModelToJson(_ServiceInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
