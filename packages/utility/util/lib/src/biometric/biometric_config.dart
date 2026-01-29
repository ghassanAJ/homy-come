/// Configuration for biometric authentication behavior.
class BiometricConfig {
  /// If true: when biometric is not available on device, allow token login.
  /// If false: when biometric is not available, block login and clear session.
  static bool allowLoginWhenBiometricUnavailable = true;

  /// Minimum splash screen delay in seconds.
  /// Ensures splash is shown for at least this duration even when no biometric check.
  static int splashDelaySeconds = 2;
}
