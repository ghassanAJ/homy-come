// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verified_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifiedUserModel _$VerifiedUserModelFromJson(Map<String, dynamic> json) =>
    _VerifiedUserModel(
      id: (json['id'] as num).toInt(),
      documentId: json['documentId'] as String,
      phone: json['phone'] as String,
      otpCode: json['otp_code'] as String?,
      roleType: json['role_type'] as String,
      profilePicture: json['profile_picture'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$VerifiedUserModelToJson(_VerifiedUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'phone': instance.phone,
      'otp_code': instance.otpCode,
      'role_type': instance.roleType,
      'profile_picture': instance.profilePicture,
      'name': instance.name,
      'address': instance.address,
    };
