// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(
      id: json['id'] as String?,
      message: json['message'] as String?,
      tokens:
          json['tokens'] == null
              ? null
              : TokenModel.fromJson(json['tokens'] as Map<String, dynamic>),
      user:
          json['user'] == null
              ? null
              : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      redirectUrl: json['redirect_url'] as String?,
      temporaryAccessToken: json['temporary_access_token'] as String?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'tokens': instance.tokens,
      'user': instance.user,
      'redirect_url': instance.redirectUrl,
      'temporary_access_token': instance.temporaryAccessToken,
    };
