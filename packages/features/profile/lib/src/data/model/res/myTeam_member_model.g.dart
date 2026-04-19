// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myTeam_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyteamMemberModel _$MyteamMemberModelFromJson(Map<String, dynamic> json) =>
    _MyteamMemberModel(
      id: (json['id'] as num).toInt(),
      nameMember: json['name_member'] as String,
      phone: json['phone'] as String,
      status: json['status'],
    );

Map<String, dynamic> _$MyteamMemberModelToJson(_MyteamMemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_member': instance.nameMember,
      'phone': instance.phone,
      'status': instance.status,
    };
