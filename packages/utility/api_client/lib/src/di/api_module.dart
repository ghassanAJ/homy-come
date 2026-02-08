import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../core/factories/dio_factory.dart';
import '../core/interceptors/auth_interceptor.dart';

@module
abstract class ApiModule {
  @Named('authDio')
  @lazySingleton
  Dio provideAuthDio(DioFactory factory) {
    return factory.createAuthDio();
  }

  @lazySingleton
  Dio provideDio(DioFactory factory, AuthInterceptor authInterceptor) {
    return factory.createDio(authInterceptor);
  }
}