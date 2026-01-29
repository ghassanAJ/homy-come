/// API environment enum
enum ApiEnvironment { dev, staging, prod, devMock }

/// API configuration for different environments
class ApiConfig {
  final String baseUrl;
  final Duration timeout;
  final bool enableLogging;
  final bool enableMocking;

  const ApiConfig({
    required this.baseUrl,
    required this.timeout,
    required this.enableLogging,
    required this.enableMocking,
  });

  /// Get configuration based on environment
  static ApiConfig getConfig(ApiEnvironment environment) {
    final localServerBaseUrl = 'http://192.168.1.90:8080';
    final remoteServerBaseUrl = 'http://16.16.192.16:8080';
    final baseUrl = remoteServerBaseUrl;
    return switch (environment) {
      ApiEnvironment.dev => ApiConfig(
        baseUrl: baseUrl,
        timeout: Duration(seconds: 10),
        enableLogging: true,
        enableMocking: false,
      ),
      ApiEnvironment.staging => ApiConfig(
        baseUrl: baseUrl,
        timeout: Duration(seconds: 15),
        enableLogging: true,
        enableMocking: false,
      ),
      ApiEnvironment.prod => ApiConfig(
        baseUrl: baseUrl,
        timeout: Duration(seconds: 30),
        enableLogging: false,
        enableMocking: false,
      ),
      ApiEnvironment.devMock => ApiConfig(
        baseUrl: baseUrl,
        timeout: Duration(seconds: 10),
        enableLogging: true,
        enableMocking: true,
      ),
    };
  }

  /// Default headers for API requests
  static const defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
