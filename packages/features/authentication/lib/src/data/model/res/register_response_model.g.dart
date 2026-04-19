// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendOTPResponseModel _$SendOTPResponseModelFromJson(
  Map<String, dynamic> json,
) => _SendOTPResponseModel(message: json['message'] as String);

Map<String, dynamic> _$SendOTPResponseModelToJson(
  _SendOTPResponseModel instance,
) => <String, dynamic>{'message': instance.message};

_VerifyOTPResponseModel _$VerifyOTPResponseModelFromJson(
  Map<String, dynamic> json,
) => _VerifyOTPResponseModel(
  jwt: json['jwt'] as String,
  user:
      json['user'] == null
          ? null
          : VerifiedUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyOTPResponseModelToJson(
  _VerifyOTPResponseModel instance,
) => <String, dynamic>{'jwt': instance.jwt, 'user': instance.user};

_RegisterInitResponseModel _$RegisterInitResponseModelFromJson(
  Map<String, dynamic> json,
) => _RegisterInitResponseModel(
  registrationId: json['registration_id'] as String?,
  id: json['id'] as String?,
  message: json['message'] as String?,
  verified: json['verified'] as bool? ?? false,
  accessToken: json['temporary_access_token'] as String?,
  phoneVerified: json['phone_verified'] as bool?,
);

Map<String, dynamic> _$RegisterInitResponseModelToJson(
  _RegisterInitResponseModel instance,
) => <String, dynamic>{
  'registration_id': instance.registrationId,
  'id': instance.id,
  'message': instance.message,
  'verified': instance.verified,
  'temporary_access_token': instance.accessToken,
  'phone_verified': instance.phoneVerified,
};
