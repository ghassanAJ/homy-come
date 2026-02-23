// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendOTPResponseModel _$SendOTPResponseModelFromJson(
  Map<String, dynamic> json,
) => _SendOTPResponseModel(
  id: json['id'] as String,
  message: json['message'] as String,
  userType: json['user_type'] as String?,
);

Map<String, dynamic> _$SendOTPResponseModelToJson(
  _SendOTPResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'message': instance.message,
  'user_type': instance.userType,
};

_VerifyOTPResponseModel _$VerifyOTPResponseModelFromJson(
  Map<String, dynamic> json,
) => _VerifyOTPResponseModel(
  id: json['id'] as String,
  phoneVerified: json['phone_verified'] as bool?,
  emailVerified: json['email_verified'] as bool?,
  message: json['message'] as String,
  user:
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  tokens:
      json['tokens'] == null
          ? null
          : TokenModel.fromJson(json['tokens'] as Map<String, dynamic>),
  redirectUrl: json['redirect_url'] as String?,
);

Map<String, dynamic> _$VerifyOTPResponseModelToJson(
  _VerifyOTPResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'phone_verified': instance.phoneVerified,
  'email_verified': instance.emailVerified,
  'message': instance.message,
  'user': instance.user,
  'tokens': instance.tokens,
  'redirect_url': instance.redirectUrl,
};

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
