import 'package:authentication/src/data/model/res/verified_user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

// Response model for /api/v1/login endpoint (OTP flow)
@freezed
abstract class SendOTPResponseModel with _$SendOTPResponseModel {
  const factory SendOTPResponseModel({required String message}) =
      _SendOTPResponseModel;

  factory SendOTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SendOTPResponseModelFromJson(json);
}

// Response model for /api/v1/verify-otp endpoint
// Backend returns: jwt, user
@freezed
abstract class VerifyOTPResponseModel with _$VerifyOTPResponseModel {
  const factory VerifyOTPResponseModel({
    required String jwt,
    VerifiedUserModel? user,
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
    @JsonKey(name: 'temporary_access_token')
    String? accessToken, // Token from verify OTP
    @JsonKey(name: 'phone_verified')
    bool? phoneVerified, // Phone verification status
  }) = _RegisterInitResponseModel;

  factory RegisterInitResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterInitResponseModelFromJson(json);
}
