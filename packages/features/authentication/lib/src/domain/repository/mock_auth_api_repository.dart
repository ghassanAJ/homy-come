import 'package:authentication/authentication.dart';
import 'package:util/util.dart';

/// Mock implementation of [AuthRepository] for testing and development.
///
/// Returns successful results with fake data. Set [failNextSendOTP],
/// [failNextVerifyOTP], etc. to true to simulate failures on the next call.
class MockAuthRepository implements AuthRepository {
  MockAuthRepository();

  /// When true, [sendOTP] returns a failure (useful for tests).
  bool failNextSendOTP = false;
  bool failNextVerifyOTP = false;
  bool failNextRefreshToken = false;
  bool failNextSaveProfile = false;
  bool failNextUpdateUserProfile = false;
  bool failNextLoginWithPin = false;
  bool failNextLogout = false;

  static SendOTPResponseModel get _mockSendOTPResponse => SendOTPResponseModel(
    id: 'mock-session-id',
    message: 'Verification code sent',
    userType: 'returning',
  );

  static VerifyOTPResponseModel get _mockVerifyOTPResponse =>
      VerifyOTPResponseModel(
        id: 'mock-verify-id',
        phoneVerified: true,
        emailVerified: false,
        message: 'Verified',
        user: _mockUser,
        tokens: _mockTokens,
        redirectUrl: null,
      );

  static TokenModel get _mockTokens => TokenModel(
    accessToken: 'mock-access-token',
    refreshToken: 'mock-refresh-token',
    expiresIn: 3600,
  );

  static ParentUser get _mockUser => ParentUser(
    id: 'mock-user-id',
    firstName: 'Mock',
    lastName: 'User',
    dob: '01/01/1990',
    cognitoId: 'mock-cognito-id',
    email: 'mock@example.com',
    phone: '+971501234567',
    profileCompleted: true,
  );

  static LoginResponseModel get _mockLoginResponse => LoginResponseModel(
    id: 'mock-id',
    message: 'Success',
    tokens: _mockTokens,
    user: _mockUser,
    redirectUrl: null,
    temporaryAccessToken: null,
  );

  @override
  Future<Result<SendOTPResponseModel, APIException>> sendOTP(
    SendOTPRequestModel sendOTPRequestModel,
  ) async {
    if (failNextSendOTP) {
      failNextSendOTP = false;
      return failure(APIException.error('Mock sendOTP failure'));
    }
    return success(_mockSendOTPResponse);
  }

  @override
  Future<Result<VerifyOTPResponseModel, APIException>> verifyOTP(
    UnifiedVerifyOTPRequestModel verifyOTPRequestModel,
  ) async {
    if (failNextVerifyOTP) {
      failNextVerifyOTP = false;
      return failure(APIException.error('Mock verifyOTP failure'));
    }
    return success(_mockVerifyOTPResponse);
  }

  @override
  Future<Result<TokenModel, APIException>> refreshToken(
    String refreshToken,
  ) async {
    if (failNextRefreshToken) {
      failNextRefreshToken = false;
      return failure(APIException.error('Mock refreshToken failure'));
    }
    return success(_mockTokens);
  }

  @override
  Future<Result<LoginResponseModel, APIException>> saveProfile(
    SaveProfileRequestModel saveProfileRequestModel,
  ) async {
    if (failNextSaveProfile) {
      failNextSaveProfile = false;
      return failure(APIException.error('Mock saveProfile failure'));
    }
    return success(_mockLoginResponse);
  }

  @override
  Future<Result<UserModel, APIException>> updateUserProfile({
    required String userId,
    required Map<String, dynamic> profileData,
  }) async {
    if (failNextUpdateUserProfile) {
      failNextUpdateUserProfile = false;
      return failure(APIException.error('Mock updateUserProfile failure'));
    }
    return success(_mockUser);
  }

  @override
  Future<Result<LoginResponseModel, APIException>> loginWithPin(
    LoginWithPinRequestModel loginWithPinRequestModel,
  ) async {
    if (failNextLoginWithPin) {
      failNextLoginWithPin = false;
      return failure(APIException.error('Mock loginWithPin failure'));
    }
    return success(_mockLoginResponse);
  }

  @override
  Future<Result<void, APIException>> logout(String refreshToken) async {
    if (failNextLogout) {
      failNextLogout = false;
      return failure(APIException.error('Mock logout failure'));
    }
    return ResultAsync.fromAsync(() async {});
  }
}
