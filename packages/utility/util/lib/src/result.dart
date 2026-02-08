import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' show DioException;
import 'package:util/src/md_exception.dart';

/// Result pattern for functional error handling
///
/// This sealed class represents either a success [S] or failure [F] state,
/// enabling functional error handling without throwing exceptions.
sealed class Result<S, F> {
  Result._();

  /// Transforms the Result by applying one of two functions based on success/failure
  B fold<B>(B Function(S s) onSuccess, B Function(F f) onFailure);

  /// Creates a Result from an async operation, catching and handling exceptions
  ///
  /// @deprecated Use [ResultAsync.fromAsync] instead
  @Deprecated('Use ResultAsync.fromAsync instead')
  static Future<Result<T, APIException>> fromAsync<T>(
    Future<T> Function() call,
  ) => ResultAsync.fromAsync(call);
}

/// Represents a successful result containing a value of type [S]
class Success<S, F> extends Result<S, F> {
  Success._(this._value) : super._();

  final S _value;

  /// Gets the success value
  S get value => _value;

  @override
  B fold<B>(B Function(S s) onSuccess, B Function(F f) onFailure) =>
      onSuccess(_value);
}

/// Represents a failed result containing an error of type [F]
class Failure<S, F> extends Result<S, F> {
  Failure._(this._error) : super._();

  final F _error;

  /// Gets the failure error
  F get error => _error;

  @override
  B fold<B>(B Function(S s) onSuccess, B Function(F f) onFailure) =>
      onFailure(_error);
}

/// Creates a successful Result with the given value
Result<S, F> success<S, F>(S value) => Success._(value);

/// Creates a failed Result with the given error
Result<S, F> failure<S, F>(F error) => Failure._(error);

// Result Extensions
extension ResultExtensions<S, F> on Result<S, F> {
  S? get successValue => fold((s) => s, (_) => null);

  F? get failureValue => fold((_) => null, (f) => f);

  bool get isSuccess => fold((_) => true, (_) => false);

  bool get isFailure => fold((_) => false, (_) => true);

  Result<T, F> map<T>(T Function(S) mapper) =>
      fold((s) => success<T, F>(mapper(s)), (f) => failure<T, F>(f));

  Result<S, T> mapFailure<T>(T Function(F) mapper) =>
      fold((s) => success<S, T>(s), (f) => failure<S, T>(mapper(f)));

  Result<T, U> bimap<T, U>(T Function(S) onSuccess, U Function(F) onFailure) =>
      fold(
        (s) => success<T, U>(onSuccess(s)),
        (f) => failure<T, U>(onFailure(f)),
      );

  Result<S, F> tap({void Function(S)? onSuccess, void Function(F)? onFailure}) {
    fold(
      (s) {
        onSuccess?.call(s);
        return s;
      },
      (f) {
        onFailure?.call(f);
        return f;
      },
    );
    return this;
  }

  S unwrap() =>
      fold((s) => s, (f) => throw f is Exception ? f : Exception(f.toString()));

  S unwrapOr(S defaultValue) => fold((s) => s, (_) => defaultValue);

  S unwrapOrElse(S Function(F) onFailure) => fold((s) => s, onFailure);
}

extension FutureResultExtensions<S, F> on Future<Result<S, F>> {
  Future<Result<T, F>> mapAsync<T>(Future<T> Function(S) mapper) async {
    final result = await this;
    return result.fold(
      (s) async => success<T, F>(await mapper(s)),
      (f) => failure<T, F>(f),
    );
  }

  Future<S> unwrapAsync() async {
    final result = await this;
    return result.unwrap();
  }

  Future<S> unwrapOrAsync(S defaultValue) async {
    final result = await this;
    return result.unwrapOr(defaultValue);
  }
}

// Result Async Helpers
class ResultAsync {
  /// Creates a Result from an async operation, catching and handling exceptions
  static Future<Result<T, APIException>> fromAsync<T>(
    Future<T> Function() call, {
    int retryCount = 1,
  }) async {
    try {
      final result = await call();
      // if (result == null &&) {
      //   return Failure._(MDException.error('No data received from server'));
      // }
      return success<T, APIException>(result);
    } on Exception catch (e) {
      log(e.toString());

      /// TODO: handle common exceptions here
      /// 1. API related exception
      /// 2. Parsing related exception
      if (e is DioException) {
        if (e.error != null && e.error is SocketException) {
          log(e.toString());

          ///most likely its because of the server connection, or the device internet issue
          return Failure._(APIException.error('No Internet Connection'));
        }
        final errorMessage = e.response?.data['error']?['message'];
        if (errorMessage != null) {
          log(e.toString());

          return Failure._(APIException.error(errorMessage));
        }
        final message = e.response?.data['message'] ?? 'Something went wrong';
        log(e.toString());

        return Failure._(APIException.error(message));
      } else if (e is APIException) {
        log(e.toString());

        return Failure._(e);
      } else {
        return Failure._(APIException.generic());
      }
    } catch (e) {
      log(e.toString());
      rethrow;
      return failure<T, APIException>(APIException.error(e.toString()));
    }
  }

  /// Creates a Result from a synchronous operation, catching and handling exceptions
  static Result<T, Exception> fromSync<T>(T Function() call) {
    try {
      final result = call();
      return success<T, Exception>(result);
    } on Exception catch (e) {
      return failure<T, Exception>(e);
    } catch (e) {
      return failure<T, Exception>(Exception(e.toString()));
    }
  }

  /// Runs an async task with retry logic
  static Future<T?> callWithRetry<T>({
    required Future<T> Function() task,
    int times = 2,
    Future<void> Function()? whenFailedError,
    Duration delay = const Duration(milliseconds: 300),
  }) async {
    int attempts = times;

    while (attempts > 0) {
      try {
        return await task();
      } catch (e, s) {
        attempts--;

        log('Retry failed ($attempts left): $e', stackTrace: s);

        if (attempts == 0) {
          if (whenFailedError != null) {
            await whenFailedError.call();
          }
          return null;
        }

        await Future.delayed(delay);
      }
    }
    return null;
  }

  /// Creates a Result from a nullable value
  static Result<T, Exception> fromNullable<T>(T? value, {Exception? onNull}) {
    if (value != null) {
      return success<T, Exception>(value);
    }
    return failure<T, Exception>(onNull ?? Exception('Value is null'));
  }
}
