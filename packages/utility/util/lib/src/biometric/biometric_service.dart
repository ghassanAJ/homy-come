import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

/// Service for handling biometric authentication.
@lazySingleton
class BiometricService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Check if the device supports biometric authentication
  /// and has enrolled biometrics.
  Future<bool> isAvailable() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } catch (_) {
      return false;
    }
  }

  /// Authenticate using biometrics or device credentials.
  /// Returns true if authentication succeeded, false otherwise.
  Future<bool> authenticate({required String reason}) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false, // Allow PIN/pattern fallback
        ),
      );
    } catch (_) {
      return false;
    }
  }
}
