import 'package:api_client/api_client.dart';
import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserAPI {
  factory UserAPI(Dio dio) = _UserAPI;
  @POST('/api/v1/users')
  Future<APIResponse<LoginResponseModel>> createProfile(
    @Body() SaveProfileRequestModel saveProfileRequestModel,
  );

  @PATCH('/api/v1/users/{id}')
  Future<APIResponse<UserModel>> updateProfile(
    @Path('id') String userId,
    @Body() Map<String, dynamic> body,
  );
}
