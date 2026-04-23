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

    /// The latitude in degrees between -90.0 and 90.0, both inclusive.
    double? latitude,

    /// The longitude in degrees between -180.0 (inclusive) and 180.0 (exclusive).
    double? longitude,
    String? name,
    String? email,
    String? address,
  }) = _VerifiedUserModel;

  factory VerifiedUserModel.fromJson(Map<String, dynamic> json) =>
      _$VerifiedUserModelFromJson(json);
}
