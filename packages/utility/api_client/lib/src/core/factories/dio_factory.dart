import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../config/api_config.dart';

@injectable
class DioFactory {
  final String environment;

  DioFactory(@Named('env') this.environment);

  /// Parse string environment to enum
  ApiEnvironment _parseEnvironment() {
    return switch (environment.toLowerCase()) {
      'dev' => ApiEnvironment.dev,
      'staging' => ApiEnvironment.staging,
      'prod' => ApiEnvironment.prod,
      'dev_mock' || 'devmock' => ApiEnvironment.devMock,
      _ => ApiEnvironment.dev, // default to dev
    };
  }

  /// Get configuration values based on environment
  ApiConfig _getConfig() {
    return ApiConfig.getConfig(_parseEnvironment());
  }

  BaseOptions _createBaseOptions() {
    final config = _getConfig();
    return BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: config.timeout,
      receiveTimeout: config.timeout,
      sendTimeout: config.timeout,
      headers: ApiConfig.defaultHeaders,
    );
  }

  Dio createAuthDio() {
    return Dio(_createBaseOptions());
  }

  Dio createDio(Interceptor authInterceptor) {
    final config = _getConfig();
    final dio = Dio(_createBaseOptions());

    // if (config.enableMocking) {
    //   dio.interceptors.add(MockInterceptor());
    // }

    dio.interceptors.add(authInterceptor);

    if (true) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      );
    }

    return dio;
  }
}
