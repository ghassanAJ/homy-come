// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIError _$APIErrorFromJson(Map<String, dynamic> json) => APIError(
  message: json['message'] as String,
  code: json['code'] as String?,
  details: json['details'] as String?,
);

Map<String, dynamic> _$APIErrorToJson(APIError instance) => <String, dynamic>{
  'message': instance.message,
  'code': instance.code,
  'details': instance.details,
};
