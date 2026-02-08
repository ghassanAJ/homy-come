import 'package:design_system/src/enums/auth_method.dart';
import 'package:design_system/src/enums/user_role.dart';

abstract class AuthenticationConfig {
  static String get deviceId => 'TEST_DEVICE_001';
  static int get phoneNumberLength => 10;
  static int get pinLength => 6;
  static int get otpLength => 6;
  static int get resendOtpCount => 5;

  // Verification screen configuration
  static int get verificationTimerSeconds => 60;
  static String get defaultPhoneNumber => '+971 50 512 3412';

  // Onboarding configuration
  static int get onBoardingAutoScrollPerSeconds => 4;
  static int get onBoardingAutoScrollDurationPerMilliSeconds => 300;
  static int get splashScreenDelayInSeconds => 1;

  // Auth methods per user role
  static List<AuthMethod> allowedMethodsFor(UserRole role) {
    switch (role) {
      case UserRole.child:
        return [AuthMethod.pin, AuthMethod.email, AuthMethod.phone];
      case UserRole.parent:
        return [AuthMethod.email, AuthMethod.phone];
      case UserRole.guest:
        return [];
    }
  }

  static List<AuthMethod> socialMethodsFor(UserRole role) {
    switch (role) {
      case UserRole.parent:
        return [AuthMethod.google, AuthMethod.apple];
      case UserRole.child:
      case UserRole.guest:
        return [];
    }
  }

  static AuthMethod defaultMethodFor(UserRole role) {
    return role.isChild ? AuthMethod.pin : AuthMethod.email;
  }
}
