// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_ref_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleRefModel _$RoleRefModelFromJson(Map<String, dynamic> json) =>
    _RoleRefModel(
      id: json['id'] as String?,
      documentId: json['documentId'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RoleRefModelToJson(_RoleRefModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
    };
