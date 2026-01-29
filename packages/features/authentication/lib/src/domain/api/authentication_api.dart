import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_api.g.dart';

@injectable
@RestApi()
abstract class AuthenticationAPI {
  @factoryMethod
  factory AuthenticationAPI(@Named('authDio') Dio dio) = _AuthenticationAPI;

  @POST('/api/v1/login')
  Future<APIResponse<SendOTPResponseModel>> sendOTP(
    @Body() SendOTPRequestModel sendOTPRequestModel,
  );
  @POST('/api/v1/verify-otp')
  Future<APIResponse<VerifyOTPResponseModel>> verifyOTP(
    @Body() UnifiedVerifyOTPRequestModel verifyOTPRequestModel,
  );

  @POST('/api/v1/refresh-token')
  Future<APIResponse<TokenModel>> refreshToken(
    @Body() Map<String, String> body,
  );

  @POST('/api/v1/login')
  Future<APIResponse<LoginResponseModel>> loginWithPin(
    @Body() LoginWithPinRequestModel loginWithPinRequestModel,
  );

  @POST('/api/v1/logout')
  Future<APIResponse<void>> logout(@Body() Map<String, String> body);
}
