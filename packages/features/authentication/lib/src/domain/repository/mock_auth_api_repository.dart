import 'package:authentication/authentication.dart';
import 'package:injectable/injectable.dart';
import 'package:util/util.dart';

/// Mock implementation of [AuthRepository] for testing and development.
///
/// Returns successful results with fake data. Set [failNextSendOTP],
/// [failNextVerifyOTP], etc. to true to simulate failures on the next call.
///
/// Registered only when running with [ENV]=dev.
@Injectable(as: AuthRepository, env: ['mock'])
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

  static SendOTPResponseModel get _mockSendOTPResponse =>
      SendOTPResponseModel(message: 'Verification code sent');

  static VerifyOTPResponseModel get _mockVerifyOTPResponse =>
      VerifyOTPResponseModel(
        jwt: 'mock-jwt',
        user: VerifiedUserModel(
          id: 1,
          documentId: 'mock-document-id',
          phone: 'mock-phone',
          otpCode: 'mock-otp-code',
          roleType: 'mock-role-type',
        ),
      );

  static TokenModel get _mockTokens => TokenModel(
    accessToken: 'mock-access-token',
    refreshToken: 'mock-refresh-token',
    expiresIn: 3600,
  );

  static VerifiedUserModel get _mockUser => VerifiedUserModel(
    id: 1,
    documentId: 'mock-document-id',
    phone: 'mock-phone',
    otpCode: 'mock-otp-code',
    roleType: 'mock-role-type',
  );

  static LoginResponseModel get _mockLoginResponse => LoginResponseModel(
    id: 'mock-id',
    message: 'Success',
    tokens: _mockTokens,
    user: null,
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
  Future<Result<VerifiedUserModel, APIException>> updateUserProfile({
    required int userId,
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
