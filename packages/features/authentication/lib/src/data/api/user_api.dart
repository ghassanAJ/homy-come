import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

class UserAPIEndpoints {
  static const String createProfile = '/api/v1/users';
  static const String updateProfile = '/api/v1/users/{id}';
}

@RestApi()
abstract class UserAPI {
  factory UserAPI(Dio dio) = _UserAPI;
  @POST(UserAPIEndpoints.createProfile)
  Future<APIResponse<LoginResponseModel>> createProfile(
    @Body() SaveProfileRequestModel saveProfileRequestModel,
  );

  @PATCH(UserAPIEndpoints.updateProfile)
  Future<APIResponse<UserModel>> updateProfile(
    @Path('id') String userId,
    @Body() Map<String, dynamic> body,
  );
}
