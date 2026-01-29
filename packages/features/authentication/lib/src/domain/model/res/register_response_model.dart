import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:authentication/src/domain/model/res/token_model.dart';
import 'package:authentication/src/domain/model/res/user_model.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

// Response model for /api/v1/login endpoint (OTP flow)
// Backend returns: id, message, user_type ("new" or "returning")
@freezed
abstract class SendOTPResponseModel with _$SendOTPResponseModel {
  const factory SendOTPResponseModel({
    required String id, // Session ID for OTP verification
    required String message,
    @JsonKey(name: 'user_type') String? userType, // "new" or "returning"
  }) = _SendOTPResponseModel;

  factory SendOTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SendOTPResponseModelFromJson(json);
}

// Response model for /api/v1/verify-otp endpoint
// Backend returns: id, phone_verified, email_verified, message, user, tokens, redirect_url
@freezed
abstract class VerifyOTPResponseModel with _$VerifyOTPResponseModel {
  const factory VerifyOTPResponseModel({
    required String id,
    @JsonKey(name: 'phone_verified') bool? phoneVerified,
    @JsonKey(name: 'email_verified') bool? emailVerified,
    required String message,
    UserModel? user, // Present when login/registration is complete
    TokenModel? tokens, // Present when login/registration is complete
    @JsonKey(name: 'redirect_url') String? redirectUrl,
  }) = _VerifyOTPResponseModel;

  factory VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPResponseModelFromJson(json);
}

// DEPRECATED: Old registration response model kept for backward compatibility
@freezed
abstract class RegisterInitResponseModel with _$RegisterInitResponseModel {
  const factory RegisterInitResponseModel({
    @JsonKey(name: 'registration_id') String? registrationId,
    @JsonKey(name: 'id') String? id, // New field from /api/v1/register-user
    String? message,
    @Default(false) bool verified,
    @JsonKey(name: 'temporary_access_token') String? accessToken, // Token from verify OTP
    @JsonKey(name: 'phone_verified') bool? phoneVerified, // Phone verification status
  }) = _RegisterInitResponseModel;

  factory RegisterInitResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterInitResponseModelFromJson(json);
}
