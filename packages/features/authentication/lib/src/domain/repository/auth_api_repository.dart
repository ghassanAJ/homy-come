import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:util/util.dart';

class AuthRepository {
  final AuthenticationAPI _authenticationAPI;
  final UserAPI _userAPI;

  AuthRepository(this._authenticationAPI, this._userAPI);

  Future<Result<SendOTPResponseModel, APIException>> sendOTP(
    SendOTPRequestModel sendOTPRequestModel,
  ) => _authenticationAPI.sendOTP(sendOTPRequestModel).toResult();

  Future<Result<VerifyOTPResponseModel, APIException>> verifyOTP(
    UnifiedVerifyOTPRequestModel verifyOTPRequestModel,
  ) => _authenticationAPI.verifyOTP(verifyOTPRequestModel).toResult();

  // Token management
  Future<Result<TokenModel, APIException>> refreshToken(String refreshToken) =>
      _authenticationAPI.refreshToken({
        'refresh_token': refreshToken,
      }).toResult();

  Future<Result<LoginResponseModel, APIException>> saveProfile(
    SaveProfileRequestModel saveProfileRequestModel,
  ) => _userAPI.createProfile(saveProfileRequestModel).toResult();

  Future<Result<UserModel, APIException>> updateUserProfile({
    required String userId,
    required Map<String, dynamic> profileData,
  }) => _userAPI.updateProfile(userId, profileData).toResult();

  Future<Result<LoginResponseModel, APIException>> loginWithPin(
    LoginWithPinRequestModel loginWithPinRequestModel,
  ) => _authenticationAPI.loginWithPin(loginWithPinRequestModel).toResult();

  Future<Result<void, APIException>> logout(String refreshToken) async {
    return await ApiResultAsync.fromAsync(() async {
      await _authenticationAPI.logout({'refresh_token': refreshToken});
    });
  }
}
