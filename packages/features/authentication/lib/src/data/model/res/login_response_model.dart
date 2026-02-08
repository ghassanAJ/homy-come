import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model_base.dart';
import 'token_model.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    String? id, // For child login response
    String? message, // For child login response
    required TokenModel? tokens,
    required UserModel? user,
    @JsonKey(name: 'redirect_url') String? redirectUrl,
    @JsonKey(name: 'temporary_access_token') String? temporaryAccessToken,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
