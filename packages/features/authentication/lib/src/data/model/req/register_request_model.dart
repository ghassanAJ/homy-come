import 'package:design_system/design_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

// Unified SendOTP request model for /api/v1/login endpoint (OTP flow)
// Backend auto-detects OTP flow when password and pin are not provided
@freezed
sealed class SendOTPRequestModel with _$SendOTPRequestModel {
  const factory SendOTPRequestModel({
    String? phone,
    String? email,
    @JsonKey(name: 'role_type') UserRole? role,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _SendOTPRequestModel;

  factory SendOTPRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendOTPRequestModelFromJson(json);
}

// Profile data for new user registration
@freezed
sealed class ProfileDataModel with _$ProfileDataModel {
  const factory ProfileDataModel({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String dob, // DD/MM/YYYY format
    String? email,
    String? password,
    String? username,
    String? nickname, // For parents: "mom", "dad", "other"
  }) = _ProfileDataModel;

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);
}

// Unified VerifyOTP request model for /api/v1/verify-otp endpoint
// Backend expects: id (session ID from login response) and otp (6-digit code)
@freezed
sealed class UnifiedVerifyOTPRequestModel with _$UnifiedVerifyOTPRequestModel {
  const factory UnifiedVerifyOTPRequestModel({
    required String id, // Session ID from login response
    required String otp, // 6-digit OTP code
    required String phone,
    @JsonKey(name: 'role_type') UserRole? role,
  }) = _UnifiedVerifyOTPRequestModel;

  factory UnifiedVerifyOTPRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UnifiedVerifyOTPRequestModelFromJson(json);
}

@freezed
abstract class SaveProfileRequestModel with _$SaveProfileRequestModel {
  const factory SaveProfileRequestModel({
    String? password, // Optional for passwordless flow
    required String username,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    String? nickname,
    required String dob,
    String? email,
    String? phone,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _SaveProfileRequestModel;

  factory SaveProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SaveProfileRequestModelFromJson(json);
}
