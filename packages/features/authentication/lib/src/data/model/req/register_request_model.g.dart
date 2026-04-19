// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendOTPRequestModel _$SendOTPRequestModelFromJson(Map<String, dynamic> json) =>
    _SendOTPRequestModel(
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role_type']),
      deviceId: json['device_id'] as String,
    );

Map<String, dynamic> _$SendOTPRequestModelToJson(
  _SendOTPRequestModel instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'email': instance.email,
  'role_type': _$UserRoleEnumMap[instance.role],
  'device_id': instance.deviceId,
};

const _$UserRoleEnumMap = {
  UserRole.user: 'user',
  UserRole.driver: 'driver',
  UserRole.provider: 'provider',
};

_ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    _ProfileDataModel(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      dob: json['dob'] as String,
      email: json['email'] as String?,
      password: json['password'] as String?,
      username: json['username'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$ProfileDataModelToJson(_ProfileDataModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'dob': instance.dob,
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'nickname': instance.nickname,
    };

_UnifiedVerifyOTPRequestModel _$UnifiedVerifyOTPRequestModelFromJson(
  Map<String, dynamic> json,
) => _UnifiedVerifyOTPRequestModel(
  id: json['id'] as String,
  otp: json['otp'] as String,
  phone: json['phone'] as String,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role_type']),
);

Map<String, dynamic> _$UnifiedVerifyOTPRequestModelToJson(
  _UnifiedVerifyOTPRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'otp': instance.otp,
  'phone': instance.phone,
  'role_type': _$UserRoleEnumMap[instance.role],
};

_SaveProfileRequestModel _$SaveProfileRequestModelFromJson(
  Map<String, dynamic> json,
) => _SaveProfileRequestModel(
  password: json['password'] as String?,
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  nickname: json['nickname'] as String?,
  dob: json['dob'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  deviceId: json['device_id'] as String,
);

Map<String, dynamic> _$SaveProfileRequestModelToJson(
  _SaveProfileRequestModel instance,
) => <String, dynamic>{
  'password': instance.password,
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'nickname': instance.nickname,
  'dob': instance.dob,
  'email': instance.email,
  'phone': instance.phone,
  'device_id': instance.deviceId,
};
