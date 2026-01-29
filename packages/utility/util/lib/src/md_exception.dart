/// Exception types used across the application
enum ExceptionType {
  error, // General errors
  generic, // Generic/unknown errors
}

/// Base exception class for all application exceptions
/// Includes HTTP-specific fields for API error handling
class APIException implements Exception {
  final String message;
  final ExceptionType type;
  final String? code; // Error code from backend (e.g., "INVALID_EMAIL")
  final int? statusCode; // HTTP status code (e.g., 401, 404, 500)

  APIException({
    required this.type,
    required this.message,
    this.code,
    this.statusCode,
  });

  // Basic factory constructors
  factory APIException.error(String message, {String? code, int? statusCode}) =>
      APIException(
        type: ExceptionType.error,
        message: message,
        code: code,
        statusCode: statusCode,
      );

  factory APIException.generic([String? message]) => APIException(
    type: ExceptionType.generic,
    message: message ?? 'An unexpected error occurred',
  );

  // HTTP/Network-specific factory constructors
  factory APIException.network(String message) =>
      APIException(type: ExceptionType.error, message: message);

  factory APIException.timeout() =>
      APIException(type: ExceptionType.error, message: 'Request timed out');

  factory APIException.unauthorized(String message) => APIException(
    type: ExceptionType.error,
    message: message,
    statusCode: 401,
  );

  factory APIException.server({String? message, int? statusCode}) =>
      APIException(
        type: ExceptionType.error,
        message: message ?? 'Server error occurred',
        statusCode: statusCode ?? 500,
      );

  factory APIException.forbidden(String message, {String? code}) =>
      APIException(
        type: ExceptionType.error,
        message: message,
        statusCode: 403,
        code: code,
      );

  factory APIException.notFound(String message, {String? code}) => APIException(
    type: ExceptionType.error,
    message: message,
    statusCode: 404,
    code: code,
  );

  @override
  String toString() => message;
}
