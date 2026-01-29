import 'package:authentication/authentication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:util/util.dart';

part 'auth_user_state.freezed.dart';

@freezed
abstract class AuthUserState with _$AuthUserState {
  const factory AuthUserState.initial() = AuthUserStateInitial;

  const factory AuthUserState.authenticated({
    required Session session,
    @Default(AuthenticationContext.unknown) AuthenticationContext context,
  }) = AuthUserStateAuthenticated;

  const factory AuthUserState.loading() = AuthUserStateLoading;

  const factory AuthUserState.error(
    APIException error,
    AuthUserErrorStateType stateType,
  ) = AuthUserStateError;

  /// Explicitly emitted when user logs out successfully
  /// Triggers automatic navigation to onboarding screen
  const factory AuthUserState.loggedOut() = AuthUserStateLoggedOut;

  /// Emitted when session expires (401 error + token refresh failed)
  /// Triggers automatic navigation to onboarding/login screen
  const factory AuthUserState.sessionExpired() = AuthUserStateSessionExpired;

  factory AuthUserState.otpSent({
    required String sessionId,
    required String identifier, // email or phone for display
    String?
    userType, // "new" or "returning" - indicates if user needs to complete profile
  }) = AuthUserStateOTPSent;
}

/// Context indicating which action triggered the authentication state
///
/// This helps distinguish between different authentication flows to enable
/// proper state handling and navigation decisions in the UI layer.
enum AuthenticationContext {
  /// Authentication triggered by OTP verification
  otpVerification,

  /// Authentication triggered by PIN login
  pinLogin,

  /// Authentication triggered by profile save/update
  profileSave,

  /// Authentication triggered by token-based login (app start, token refresh)
  tokenLogin,

  /// Authentication triggered by social login (Google, Apple, etc.)
  socialLogin,

  /// Context is unknown or not specified (default/legacy)
  unknown,
}

enum AuthUserErrorStateType {
  loginWithToken,
  loginWithPin,
  logout,
  refreshToken,
  sendOTP,
  verifyOTP,
  saveProfile,
}
