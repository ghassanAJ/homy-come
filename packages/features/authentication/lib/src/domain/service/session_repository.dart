import 'dart:convert';

import 'package:authentication/authentication.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:util/util.dart'
    show BiometricConfig, BiometricService, MDStorage;

@singleton
class SessionRepository {
  final TokenStorage _tokenStorage;
  final MDStorage _storage;
  final BiometricService _biometricService;

  static const String userKey = 'md_user';

  final _userController = BehaviorSubject<UserModel?>();

  Stream<UserModel?> get userStream => _userController.stream;

  UserModel? get currentUser => _userController.valueOrNull;

  SessionRepository(this._tokenStorage, this._storage, this._biometricService) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final stopwatch = Stopwatch()..start();
      final user = await getUser();

      // If no user stored, wait for minimum splash delay then emit null
      if (user == null) {
        await _ensureMinimumDelay(stopwatch);
        _userController.add(null);
        return;
      }

      // User exists - determine if authentication should succeed
      final isBiometricAvailable = await _biometricService.isAvailable();
      final shouldAuthenticate =
          isBiometricAvailable
              ? await _biometricService.authenticate(
                reason: 'Verify your identity to access Maddo',
              )
              : BiometricConfig.allowLoginWhenBiometricUnavailable;

      // Ensure minimum splash delay before emitting result
      await _ensureMinimumDelay(stopwatch);

      if (shouldAuthenticate) {
        _userController.add(user);
      } else {
        await clearSession();
      }
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

  Future<UserModel?> getUser() async {
    final userString = await _storage.read(userKey);
    if (userString == null || userString.isEmpty) {
      return null;
    }
    try {
      final userJson = jsonDecode(userString);
      return UserModelFactory.fromJson(userJson);
    } catch (_) {
      return null;
    }
  }

  Future<void> updateUser(UserModel user) async {
    final userString = jsonEncode(user.toJson());
    await _storage.write(userKey, userString);
    _userController.add(user);
  }

  Future<void> clearUser() async {
    await _storage.delete(userKey);
    _userController.add(null);
  }

  Future<Session?> getSession() async {
    final accessToken = await _tokenStorage.getAccessToken();
    final refreshToken = await _tokenStorage.getRefreshToken();

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    final user = await getUser();

    return Session(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }

  Future<void> saveSessionFromResponse(LoginResponseModel response) async {
    if (response.tokens != null) {
      await _tokenStorage.saveTokens(
        accessToken: response.tokens!.accessToken,
        refreshToken: response.tokens!.refreshToken,
      );
    }

    if (response.user != null) {
      await updateUser(response.user!);
    }
  }

  Future<void> saveSession(Session session) async {
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
