import 'dart:convert';

import 'package:authentication/authentication.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:util/util.dart';

@singleton
class SessionRepository {
  final TokenStorage _tokenStorage;
  final MDStorage _storage;
  final BiometricService _biometricService;

  static const String userKey = 'md_user';

  final _userController = BehaviorSubject<VerifiedUserModel?>();

  Stream<VerifiedUserModel?> get userStream => _userController.stream;

  VerifiedUserModel? get currentUser => _userController.valueOrNull;

  SessionRepository(this._tokenStorage, this._storage, this._biometricService) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final user = await getUser();

      // If no user stored, wait for minimum splash delay then emit null
      if (user == null) {
        _userController.add(null);
        return;
      }

      // User exists - determine if authentication should succeed
      // final isBiometricAvailable = await _biometricService.isAvailable();
      // final shouldAuthenticate =
      //     isBiometricAvailable
      //         ? await _biometricService.authenticate(
      //           reason: 'Verify your identity to access Maddo',
      //         )
      //         : BiometricConfig.allowLoginWhenBiometricUnavailable;

      // Ensure minimum splash delay before emitting result

      _userController.add(user);
    } catch (e) {
      // If any error occurs during initialization, emit null to allow app to continue
      _userController.add(null);
    }
  }

  /// Ensures minimum splash delay has elapsed before proceeding
  Future<void> _ensureMinimumDelay(Stopwatch stopwatch) async {
    final minDelayMs = BiometricConfig.splashDelaySeconds * 1000;
    final elapsedMs = stopwatch.elapsedMilliseconds;
    if (elapsedMs < minDelayMs) {
      await Future.delayed(Duration(milliseconds: minDelayMs - elapsedMs));
    }
  }

  /// Dispose resources
  void dispose() {
    _userController.close();
  }

  Future<String?> getAccessToken() => _tokenStorage.getAccessToken();
  Future<String?> getRefreshToken() => _tokenStorage.getRefreshToken();
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) => _tokenStorage.saveTokens(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );

  Future<void> clearTokens() => _tokenStorage.clearTokens();

  Future<VerifiedUserModel?> getUser() async {
    final userString = await _storage.read(userKey);
    if (userString == null || userString.isEmpty) {
      return null;
    }
    try {
      final userJson = jsonDecode(userString);
      return VerifiedUserModel.fromJson(userJson);
    } catch (_) {
      return null;
    }
  }

  Future<void> updateUser(VerifiedUserModel user) async {
    final userString = jsonEncode(user.toJson());
    await _storage.write(userKey, userString);
    _userController.add(user);
  }

  Future<void> clearUser() async {
    await _storage.delete(userKey);
    _userController.add(null);
  }

  Future<SessionModel?> getSession() async {
    final accessToken = await _tokenStorage.getAccessToken();
    final refreshToken = await _tokenStorage.getRefreshToken();

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    final user = await getUser();

    return SessionModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }

  Future<void> saveSessionFromResponse(VerifyOTPResponseModel response) async {
    await _tokenStorage.saveTokens(
      accessToken: response.jwt,
      refreshToken: response.jwt,
    );

    if (response.user != null) {
      print('response.user: ${response.user?.toJson()}');
      await updateUser(response.user!);
    }
  }

  Future<void> saveSession(SessionModel session) async {
    await _tokenStorage.saveTokens(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
    );

    if (session.user != null) {
      await updateUser(session.user!);
    }
  }

  Future<void> clearSession() async {
    await _tokenStorage.clearTokens();
    await clearUser();
  }
}
