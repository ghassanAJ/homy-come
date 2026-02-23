
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

// OTP-based login request model (deprecated - use unified SendOTP flow)
@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
  toJson: false,
)
sealed class LoginWithOTPRequestModel with _$LoginWithOTPRequestModel {
  const LoginWithOTPRequestModel._();

  @FreezedUnionValue('email')
  const factory LoginWithOTPRequestModel.email({
    required String email,
    @JsonKey(name: 'flow_type') @Default('otp') String flowType,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = EmailOTPRequestModel;

  @FreezedUnionValue('phoneNumber')
  const factory LoginWithOTPRequestModel.phoneNumber({
    @JsonKey(name: 'phone') required String phoneNumber,
    @JsonKey(name: 'flow_type') @Default('otp') String flowType,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = PhoneOTPRequestModel;

  factory LoginWithOTPRequestModel.fromJson(Map<String, Object?> json) =>
      _$LoginWithOTPRequestModelFromJson(json);

  /// Custom toJson that excludes the 'type' discriminator field
  Map<String, dynamic> toJson() {
    return switch (this) {
      EmailOTPRequestModel(:final email, :final flowType, :final deviceId) => {
        'email': email,
        'flow_type': flowType,
        'device_id': deviceId,
      },
      PhoneOTPRequestModel(:final phoneNumber, :final flowType, :final deviceId) => {
        'phone': phoneNumber,
        'flow_type': flowType,
        'device_id': deviceId,
      },
    };
  }
}

// PIN-based login request model for child authentication
@freezed
sealed class LoginWithPinRequestModel with _$LoginWithPinRequestModel {
  const factory LoginWithPinRequestModel({
    required String pin, // 6-digit PIN code
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _LoginWithPinRequestModel;

  factory LoginWithPinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginWithPinRequestModelFromJson(json);
}
