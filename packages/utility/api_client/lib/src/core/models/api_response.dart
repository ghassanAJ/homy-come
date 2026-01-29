import 'package:json_annotation/json_annotation.dart';
import 'package:util/util.dart' show Result, APIException;

import '../helpers/api_result_async.dart';

part 'api_response.g.dart';

sealed class APIResponse<T> {
  const APIResponse();

  bool get isSuccess;
  bool get isError => !isSuccess;

  factory APIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    final success = json['success'] as bool? ?? true;

    if (success) {
      final data = json['data'];
      if (data == null) {
        throw FormatException('Success response must have data field');
      }
      return SuccessResponse<T>(fromJsonT(data));
    } else {
      final errorJson = json['error'];
      final error =
          errorJson != null
              ? APIError.fromJson(errorJson as Map<String, dynamic>)
              : APIError(
                message: json['message'] as String? ?? 'Unknown error',
              );
      return ErrorResponse<T>(error);
    }
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT);
}

/// Represents a successful API response with data
final class SuccessResponse<T> extends APIResponse<T> {
  final T data;

  const SuccessResponse(this.data);

  @override
  bool get isSuccess => true;

  @override
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {'success': true, 'data': toJsonT(data)};
  }
}

/// Represents a failed API response with error information
final class ErrorResponse<T> extends APIResponse<T> {
  final APIError error;

  const ErrorResponse(this.error);

  @override
  bool get isSuccess => false;

  @override
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {'success': false, 'error': error.toJson()};
  }
}

// API Error structure matching backend
@JsonSerializable()
class APIError {
  final String message;
  final String? code;
  final String? details;

  const APIError({required this.message, this.code, this.details});

  factory APIError.fromJson(Map<String, dynamic> json) {
    return _$APIErrorFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$APIErrorToJson(this);
  }
}

// Extensions for converting APIResponse to Result pattern
extension APIResponseExtensions<T> on APIResponse<T> {
  /// Extracts data from APIResponse or throws MDException
  ///
  /// This handles the pattern matching and converts APIError to MDException.
  /// Perfect for use with ResultAsync.fromAsync.
  ///
  /// Example:
  /// ```dart
  /// return await ResultAsync.fromAsync(() async {
  ///   final response = await _api.getData();
  ///   return response.unwrap(); // Throws MDException if error
  /// });
  /// ```
  T unwrap() {
    return switch (this) {
      SuccessResponse(data: final data) => data,
      ErrorResponse(error: final error) =>
        throw APIException.error(error.message, code: error.code),
    };
  }
}

extension FutureAPIResponseExtensions<T> on Future<APIResponse<T>> {
  /// Converts `Future<APIResponse<T>>` directly to `Future<Result<T, MDException>>`
  ///
  /// Ultra clean one-liner for repository methods:
  /// ```dart
  /// Future<Result<User, MDException>> getUser(String id) =>
  ///   _api.getUser(id).toResult();
  /// ```
  Future<Result<T, APIException>> toResult() async {
    return ApiResultAsync.fromAsync(() async {
      final response = await this;
      return response.unwrap();
    });
  }
}
