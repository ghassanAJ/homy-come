import 'package:authentication/authentication.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_provider/navigation/route.dart';
import 'package:user/navigation/route.dart';
import 'package:profile/src/navigation/router.dart';

class AppRouterGuard {
  static final List<String> guestAllowedPaths = [
    UserPaths.home,
    UserPaths.search,
    UserPaths.category,
    UserPaths.services,
    UserPaths.notifications,
    UserPaths.profile,
  ];

  static bool _isOtpPath(String path) =>
      path == AuthenticationPaths.otpVerification ||
      path.endsWith(AuthenticationPaths.otpVerification) ||
      path.contains('${AuthenticationPaths.otpVerification}/');

  static final List<String> authPaths = [
    AuthenticationPaths.onboarding,
    AuthenticationPaths.splash,
    AuthenticationPaths.login,
    AuthenticationPaths.signup,
    AuthenticationPaths.selectRole,
    AuthenticationPaths.authEntry,
    AuthenticationPaths.otpVerification,
  ];

  static String? handleRedirect(GoRouterState state, AppState appState) {
    final currentPath = state.matchedLocation;

    // Keep showing splash while initializing (biometric check in progress)
    if (appState.isInitializing) {
      if (currentPath != AuthenticationPaths.splash) {
        return AuthenticationPaths.splash;
      }
      return null;
    }

    if (!appState.isAuthenticated) {
      return _handleUnauthenticatedRedirect(currentPath);
    }

    if (appState.isAuthenticated && appState.user != null) {
      // Allow OTP screen to display success state and let user continue manually.
      if (_isOtpPath(currentPath)) {
        return null;
      }

      // Check if profile is complete before allowing access to authenticated routes
      if (!appState.user!.hasCompletedProfile &&
          currentPath != AuthenticationPaths.completeProfile) {
        return AuthenticationPaths.completeProfile;
      }
      return _handleAuthenticatedRedirect(currentPath, appState);
    }

    return null;
  }

  static String? _handleUnauthenticatedRedirect(String currentPath) {
    // 1. Splash → Onboarding
    if (currentPath == AuthenticationPaths.splash) {
      return AuthenticationPaths.onboarding;
    }

    // 2. If on any auth path, stay there (onboarding, login, select-role, etc.)
    if (authPaths.contains(currentPath) ||
        guestAllowedPaths.contains(currentPath)) {
      return null;
    }

    // 3. Unknown path (e.g. /dashboard) → Login
    return AuthenticationPaths.login;

    ///[هون]
  }

  static String _getDashboardPath(UserType? userType) {
    return switch (userType) {
      UserType.parent => UserPaths.home,
      UserType.child => UserPaths.home,
      null => UserPaths.home,
    };
  }

  static String? _handleAuthenticatedRedirect(
    String currentPath,
    AppState appState,
  ) {
    final user = appState.user;

    if (_isOtpPath(currentPath)) {
      return null;
    }

    // Redirect completed profiles from auth screens to dashboard
    if (authPaths.contains(currentPath)) {
      return _getDashboardPath(user?.type);
    }

    // Redirect completed profiles from complete profile screen to dashboard
    if (currentPath == AuthenticationPaths.completeProfile &&
        user?.hasCompletedProfile == true) {
      return _getDashboardPath(user?.type);
    }

    return null;
  }
}
