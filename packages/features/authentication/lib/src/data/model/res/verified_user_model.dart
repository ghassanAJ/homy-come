import 'package:freezed_annotation/freezed_annotation.dart';

part 'verified_user_model.freezed.dart';
part 'verified_user_model.g.dart';

@freezed
abstract class VerifiedUserModel with _$VerifiedUserModel {
  const factory VerifiedUserModel({
    required int id,
    @JsonKey(name: 'documentId') required String documentId,
    required String phone,
    @JsonKey(name: 'otp_code') String? otpCode,
    @JsonKey(name: 'role_type') required String roleType,
    @JsonKey(name: 'profile_picture') String? profilePicture,
    String? name,
    String? address,
  }) = _VerifiedUserModel;

  factory VerifiedUserModel.fromJson(Map<String, dynamic> json) =>
      _$VerifiedUserModelFromJson(json);
}
