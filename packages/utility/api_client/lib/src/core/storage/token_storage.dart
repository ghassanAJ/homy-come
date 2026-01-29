import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:util/util.dart' show MDStorage;

@singleton
class TokenStorage {
  final MDStorage _storage;

  static const String accessTokenKey = 'md_access_token';
  static const String refreshTokenKey = 'md_refresh_token';

  TokenStorage(this._storage);

  Future<String?> getAccessToken() async {
    return await _storage.read(accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(refreshTokenKey);
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(accessTokenKey, accessToken);
    await _storage.write(refreshTokenKey, refreshToken);
  }

  Future<void> clearTokens() async {
    await _storage.delete(accessTokenKey);
    await _storage.delete(refreshTokenKey);
  }

  bool isTokenExpired(String? token) {
    if (token == null || token.isEmpty) return true;

    try {
      return JwtDecoder.isExpired(token);
    } catch (_) {
      return true;
    }
  }
}
