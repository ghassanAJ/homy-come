import 'package:authentication/authentication.dart';

sealed class AuthUserEvent {}

/// Auto-login with stored session token
class AutoLogin extends AuthUserEvent {
  AutoLogin();
}

/// User logout
class Logout extends AuthUserEvent {}

/// Session expired (token invalid/expired)
class SessionExpired extends AuthUserEvent {}

/// Step 1: Send OTP - Works for both login and registration
/// The API auto-detects if user exists
class SendOTP extends AuthUserEvent {
  final SendOTPRequestModel request;
  SendOTP(this.request);
}

/// Step 2: Verify OTP - Auto-detects login vs registration
class VerifyOTP extends AuthUserEvent {
  final UnifiedVerifyOTPRequestModel request;
  VerifyOTP(this.request);
}

/// Finalize OTP login after user confirms success bottom sheet action
class CompleteOtpAuthentication extends AuthUserEvent {
  CompleteOtpAuthentication();
}

/// Update user profile - used to complete profile after registration
/// The userId is retrieved automatically from the current session
class UpdateProfile extends AuthUserEvent {
  final VerifiedUserModel user;
  UpdateProfile(this.user);
}

/// Direct login with 6-digit PIN code (no OTP verification needed)
class LoginWithPin extends AuthUserEvent {
  final LoginWithPinRequestModel request;
  LoginWithPin(this.request);
}
