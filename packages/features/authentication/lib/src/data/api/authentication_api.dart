import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_api.g.dart';

class AuthenticationAPIEndpoints {
  static const String sendOTP = '/api/phone-auth/request-otp';
  static const String verifyOTP = '/api/phone-auth/verify-otp';
  static const String refreshToken = '/api/v1/refresh-token';
  static const String logout = '/api/v1/logout';
  static const String loginWithPin = '/api/v1/login';
  static const String createProfile = '/api/v1/users';
  static const String updateProfile = '/api/v1/users/{id}';
}

@injectable
@RestApi()
abstract class AuthenticationAPI {
  @factoryMethod
  factory AuthenticationAPI(@Named('authDio') Dio dio) = _AuthenticationAPI;

  @POST(AuthenticationAPIEndpoints.sendOTP)
  Future<APIResponse<SendOTPResponseModel>> sendOTP(
    @Body() Map<String, dynamic> body,
  );
  @POST(AuthenticationAPIEndpoints.verifyOTP)
  Future<APIResponse<VerifyOTPResponseModel>> verifyOTP(
    @Body() Map<String, dynamic> verifyOTPRequestModel,
  );

  @POST(AuthenticationAPIEndpoints.refreshToken)
  Future<APIResponse<TokenModel>> refreshToken(
    @Body() Map<String, String> body,
  );

  @POST(AuthenticationAPIEndpoints.loginWithPin)
  Future<APIResponse<LoginResponseModel>> loginWithPin(
    @Body() LoginWithPinRequestModel loginWithPinRequestModel,
  );

  @POST(AuthenticationAPIEndpoints.logout)
  Future<APIResponse<void>> logout(@Body() Map<String, String> body);
}
