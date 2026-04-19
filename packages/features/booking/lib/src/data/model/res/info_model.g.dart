// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceInfoModel _$ServiceInfoModelFromJson(Map<String, dynamic> json) =>
    _ServiceInfoModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
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

_ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) =>
    _ProviderModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProviderModelToJson(_ProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'image': instance.image,
    };
