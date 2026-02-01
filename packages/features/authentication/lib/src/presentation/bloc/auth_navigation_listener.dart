import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';
import 'package:util/util.dart';

class AuthNavigationListener extends StatelessWidget {
  final Widget child;
  final GoRouter router;
  final String dashboardPath;

  const AuthNavigationListener({
    super.key,
    required this.child,
    required this.router,
    this.dashboardPath = UserPaths.home,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthUserBloc, AuthUserState>(
      listenWhen: _shouldListen,
      listener: _onStateChanged,
      child: child,
    );
  }

  bool _shouldListen(AuthUserState previous, AuthUserState current) {
    return current is AuthUserStateOTPSent ||
        current is AuthUserStateAuthenticated ||
        current is AuthUserStateLoggedOut ||
        current is AuthUserStateSessionExpired;
  }

  void _onStateChanged(BuildContext context, AuthUserState state) {
    switch (state) {
      case AuthUserStateOTPSent():
        _onOtpSent(context, state);
      case AuthUserStateAuthenticated():
        _onAuthenticated(state);
      case AuthUserStateLoggedOut():
      case AuthUserStateSessionExpired():
        _onLoggedOut();
      default:
        break;
    }
  }

  void _onOtpSent(BuildContext context, AuthUserStateOTPSent state) {
    final tr = AuthenticationTranslation();
    ToastificationUtil.success(tr.verification.codeSent);

    // Only navigate to OTP screen if not already there (prevents duplicate push on resend)
    final matches = router.routerDelegate.currentConfiguration.matches;
    final currentLocation =
        matches.isNotEmpty ? matches.last.matchedLocation : '';

    if (currentLocation != AuthenticationPaths.otpVerification) {
      router.push(
        AuthenticationPaths.otpVerification,
        extra: {
          AuthRouteParams.verificationId: state.sessionId,
          AuthRouteParams.userInput: state.identifier,
          AuthRouteParams.userType: state.userType ?? '',
        },
      );
    }
  }

  void _onAuthenticated(AuthUserStateAuthenticated state) {
    final hasCompletedProfile =
        state.session.user?.hasCompletedProfile ?? false;
    final authContext = state.context;

    switch (authContext) {
      case AuthenticationContext.otpVerification:
        _navigateAfterOtpVerification(hasCompletedProfile);

      case AuthenticationContext.profileSave:
        _navigateAfterProfileSave();

      case AuthenticationContext.pinLogin:
        _navigateAfterPinLogin();

      case AuthenticationContext.tokenLogin:
        _navigateAfterTokenLogin(hasCompletedProfile);

      case AuthenticationContext.socialLogin:
        _navigateAfterSocialLogin(hasCompletedProfile);

      default:
        break;
    }
  }

  void _onLoggedOut() {
    router.go(AuthenticationPaths.login);
  }

  void _navigateAfterOtpVerification(bool hasCompletedProfile) {
    final tr = AuthenticationTranslation();

    if (hasCompletedProfile) {
      ToastificationUtil.success(tr.verification.returningUserVerified);
      router.go(dashboardPath);
    } else {
      ToastificationUtil.success(tr.verification.newUserVerified);
      router.go(AuthenticationPaths.completeProfile);
    }
  }

  void _navigateAfterProfileSave() {
    final tr = AuthenticationTranslation();
    ToastificationUtil.success(tr.personalInfo.profileCompleted);
    router.go(dashboardPath);
  }

  void _navigateAfterPinLogin() {
    final tr = AuthenticationTranslation();
    ToastificationUtil.success(tr.verification.returningUserVerified);
    router.go(dashboardPath);
  }

  /// Token login is silent (auto-login) - no toast shown.
  void _navigateAfterTokenLogin(bool hasCompletedProfile) {
    final destination =
        hasCompletedProfile
            ? dashboardPath
            : AuthenticationPaths.completeProfile;
    router.go(destination);
  }

  void _navigateAfterSocialLogin(bool hasCompletedProfile) {
    final tr = AuthenticationTranslation();

    if (hasCompletedProfile) {
      ToastificationUtil.success(tr.verification.returningUserVerified);
      router.go(dashboardPath);
    } else {
      ToastificationUtil.success(tr.verification.newUserVerified);
      router.go(AuthenticationPaths.completeProfile);
    }
  }
}
