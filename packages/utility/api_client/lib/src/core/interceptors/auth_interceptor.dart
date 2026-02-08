import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart';

typedef TokenRefreshCallback =
    Future<({String accessToken, String refreshToken})?> Function(
      String refreshToken,
    );

@singleton
class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;
  final Dio _authDio;

  final Lock _refreshLock = Lock();

  void Function()? onSessionExpired;

  TokenRefreshCallback? tokenRefreshCallback;

  AuthInterceptor(this._tokenStorage, @Named('authDio') this._authDio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    final refreshSuccess = await _refreshToken();

    if (!refreshSuccess) {
      await _tokenStorage.clearTokens();
      onSessionExpired?.call();
      handler.next(err);
      return;
    }

    try {
      final newAccessToken = await _tokenStorage.getAccessToken();
      if (newAccessToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      }

      final response = await _authDio.fetch(err.requestOptions);
      handler.resolve(response);
    } catch (retryError) {
      handler.next(err);
    }
  }

  Future<bool> _refreshToken() async {
    return await _refreshLock.synchronized(() async {
      try {
        final refreshToken = await _tokenStorage.getRefreshToken();

        // Check if refresh token exists and is not expired
        if (refreshToken == null || refreshToken.isEmpty) {
          return false;
        }

        if (_tokenStorage.isTokenExpired(refreshToken)) {
          return false;
        }

        if (tokenRefreshCallback == null) {
          return false;
        }

        final tokens = await tokenRefreshCallback!(refreshToken);

        if (tokens == null) {
          return false;
        }

        await _tokenStorage.saveTokens(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        );

        return true;
      } catch (error) {
        return false;
      }
    });
  }
}
