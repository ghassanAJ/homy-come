import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:injectable/injectable.dart';
import 'package:util/util.dart';

abstract class AuthRepository {
  Future<Result<SendOTPResponseModel, APIException>> sendOTP(
    SendOTPRequestModel sendOTPRequestModel,
  );
  Future<Result<VerifyOTPResponseModel, APIException>> verifyOTP(
    UnifiedVerifyOTPRequestModel verifyOTPRequestModel,
  );
  Future<Result<TokenModel, APIException>> refreshToken(String refreshToken);
  Future<Result<LoginResponseModel, APIException>> saveProfile(
    SaveProfileRequestModel saveProfileRequestModel,
  );
  Future<Result<UserModel, APIException>> updateUserProfile({
    required String userId,
    required Map<String, dynamic> profileData,
  });
  Future<Result<LoginResponseModel, APIException>> loginWithPin(
    LoginWithPinRequestModel loginWithPinRequestModel,
  );
  Future<Result<void, APIException>> logout(String refreshToken);
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthenticationAPI _authenticationAPI;
  final UserAPI _userAPI;

  AuthRepositoryImpl(this._authenticationAPI, this._userAPI);

  @override
  Future<Result<SendOTPResponseModel, APIException>> sendOTP(
    SendOTPRequestModel sendOTPRequestModel,
  ) => _authenticationAPI.sendOTP(sendOTPRequestModel).toResult();

  @override
  Future<Result<VerifyOTPResponseModel, APIException>> verifyOTP(
    UnifiedVerifyOTPRequestModel verifyOTPRequestModel,
  ) => _authenticationAPI.verifyOTP(verifyOTPRequestModel).toResult();

  // Token management
  @override
  Future<Result<TokenModel, APIException>> refreshToken(String refreshToken) =>
      _authenticationAPI.refreshToken({
        'refresh_token': refreshToken,
      }).toResult();

  @override
  Future<Result<LoginResponseModel, APIException>> saveProfile(
    SaveProfileRequestModel saveProfileRequestModel,
  ) => _userAPI.createProfile(saveProfileRequestModel).toResult();

  @override
  Future<Result<UserModel, APIException>> updateUserProfile({
    required String userId,
    required Map<String, dynamic> profileData,
  }) => _userAPI.updateProfile(userId, profileData).toResult();

  @override
  Future<Result<LoginResponseModel, APIException>> loginWithPin(
    LoginWithPinRequestModel loginWithPinRequestModel,
  ) => _authenticationAPI.loginWithPin(loginWithPinRequestModel).toResult();

  @override
  Future<Result<void, APIException>> logout(String refreshToken) async {
    return await ApiResultAsync.fromAsync(() async {
      await _authenticationAPI.logout({'refresh_token': refreshToken});
    });
  }
}
