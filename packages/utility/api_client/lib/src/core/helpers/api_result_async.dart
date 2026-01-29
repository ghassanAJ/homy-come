import 'dart:developer';

import 'package:dio/dio.dart' show DioException;
import 'package:util/util.dart' show Result, success, failure, APIException;

import '../handlers/dio_exception_handler.dart';

/// API-specific Result async helpers with MDException handling
class ApiResultAsync {
  static const _exceptionHandler = DioExceptionHandler.instance;

  /// Creates a Result from an async operation, with API-specific exception handling
  static Future<Result<T, APIException>> fromAsync<T>(
    Future<T> Function() call,
  ) async {
    try {
      final result = await call();

      return success<T, APIException>(result);
    } on DioException catch (e) {
      log('DioException: ${e.toString()}');

      return failure<T, APIException>(_exceptionHandler.handleDioException(e));
    } on APIException catch (e) {
      log('MDException: ${e.toString()}');

      return failure<T, APIException>(e);
    } on Exception catch (e) {
      log('Exception: ${e.toString()}');
      return failure<T, APIException>(APIException.generic());
    }
  }
}
