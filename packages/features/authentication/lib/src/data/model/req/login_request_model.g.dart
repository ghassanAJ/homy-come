// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailOTPRequestModel _$EmailOTPRequestModelFromJson(
  Map<String, dynamic> json,
) => EmailOTPRequestModel(
  email: json['email'] as String,
  flowType: json['flow_type'] as String? ?? 'otp',
  deviceId: json['device_id'] as String,
  $type: json['type'] as String?,
);

PhoneOTPRequestModel _$PhoneOTPRequestModelFromJson(
  Map<String, dynamic> json,
) => PhoneOTPRequestModel(
  phoneNumber: json['phone'] as String,
  flowType: json['flow_type'] as String? ?? 'otp',
  deviceId: json['device_id'] as String,
  $type: json['type'] as String?,
);

_LoginWithPinRequestModel _$LoginWithPinRequestModelFromJson(
  Map<String, dynamic> json,
) => _LoginWithPinRequestModel(
  pin: json['pin'] as String,
  deviceId: json['device_id'] as String,
);

Map<String, dynamic> _$LoginWithPinRequestModelToJson(
  _LoginWithPinRequestModel instance,
) => <String, dynamic>{'pin': instance.pin, 'device_id': instance.deviceId};
