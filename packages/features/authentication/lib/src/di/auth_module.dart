import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @injectable
  UserAPI provideUserAPI(Dio dio) => UserAPI(dio);

  @injectable
  AuthRepository provideAuthRepository(
    AuthenticationAPI authenticationAPI,
    UserAPI userAPI,
  ) => AuthRepository(authenticationAPI, userAPI);
}
