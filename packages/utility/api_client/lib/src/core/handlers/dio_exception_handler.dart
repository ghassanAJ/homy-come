import 'dart:io';

import 'package:dio/dio.dart' show DioException, DioExceptionType;
import 'package:util/util.dart' show APIException;

class DioExceptionHandler {
  static const DioExceptionHandler instance = DioExceptionHandler._();

  const DioExceptionHandler._();

  APIException handleDioException(DioException e) {
    // Network errors
    if (e.error != null && e.error is SocketException) {
      return APIException.network('No Internet Connection');
    }

    // Timeout errors
    if (_isTimeoutException(e)) {
      return APIException.timeout();
    }

    // API error responses
    if (e.response != null) {
      return _handleResponseError(e);
    }

    return APIException.generic();
  }

  bool _isTimeoutException(DioException e) {
    return e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout;
  }

  APIException _handleResponseError(DioException e) {
    final statusCode = e.response!.statusCode;
    final data = e.response!.data;

    final errorInfo = _extractErrorInfo(data);

    // Create appropriate exception based on status code
    return switch (statusCode) {
      401 => APIException.unauthorized(
        errorInfo.message ?? 'Authentication required',
      ),
      403 => APIException.forbidden(
        errorInfo.message ?? 'Access forbidden',
        code: errorInfo.code,
      ),
      404 => APIException.notFound(
        errorInfo.message ?? 'Resource not found',
        code: errorInfo.code,
      ),
      int() when statusCode >= 500 => APIException.server(
        message: errorInfo.message,
        statusCode: statusCode,
      ),
      _ => APIException.error(
        errorInfo.message ?? 'Request failed',
        statusCode: statusCode,
        code: errorInfo.code,
      ),
    };
  }

  _ErrorInfo _extractErrorInfo(dynamic data) {
    // Handle string responses directly
    if (data is String) {
      return _ErrorInfo(message: data);
    }

    if (data is! Map<String, dynamic>) {
      return const _ErrorInfo();
    }

    String? errorMessage;
    String? errorCode;

    // Handle various backend error structures
    if (data['error'] != null) {
      if (data['error'] is Map) {
        // Nested error object: {error: {message: "...", code: "..."}}
        final errorData = data['error'] as Map<String, dynamic>;
        errorMessage = errorData['message'] as String?;
        errorCode = errorData['code'] as String?;
      } else if (data['error'] is String) {
        // Direct error string: {error: "..."}
        errorMessage = data['error'] as String?;
      }
    } else if (data['errors'] != null && data['errors'] is List) {
      // Array of errors: {errors: [{message: "..."}]}
      final errors = data['errors'] as List;
      if (errors.isNotEmpty && errors.first is Map) {
        final firstError = errors.first as Map<String, dynamic>;
        errorMessage = firstError['message'] as String?;
        errorCode = firstError['code'] as String?;
      }
    } else if (data['message'] != null) {
      // Direct message: {message: "..."}
      errorMessage = data['message'] as String?;
      errorCode = data['code'] as String?;
    }

    return _ErrorInfo(message: errorMessage, code: errorCode);
  }
}

class _ErrorInfo {
  final String? message;
  final String? code;

  const _ErrorInfo({this.message, this.code});
}
