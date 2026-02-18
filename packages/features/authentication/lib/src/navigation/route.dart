import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/auth_localization_scope.dart';
import 'package:authentication/src/presentation/screens/onboarding/splash_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:go_provider/go_provider.dart';
import 'package:go_router/go_router.dart';

/// Authentication route paths
class AuthenticationPaths {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String selectRole = '/select-role';
  static const String authEntry = '/auth-entry';
  static const String otpVerification = '/otp-verification';
  static const String completeProfile = '/complete-profile';
  static const String login = '/login';
}

class AuthRouteParams {
  AuthRouteParams._();
  static const String userInput = 'userInput';
  static const String verificationId = 'verificationId';
  static const String userType = 'userType';
  static const String userRole = 'userRole';
}

class AuthenticationRoute {
  /// Auth routes wrapped in [ShellProviderRoute] so [AuthenticationTranslation]
  /// is provided via [AuthLocalizationScope] and available as [BuildContext.loc].
  static List<RouteBase> get routes => [
    ShellProviderRoute(
      providers: (context, state) => [const AuthLocalizationScope()],
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: AuthenticationPaths.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AuthenticationPaths.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AuthenticationPaths.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AuthenticationPaths.authEntry,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final roleString = extra?[AuthRouteParams.userRole] as String?;
            final userRole = UserRole.tryParse(roleString) ?? UserRole.parent;
            return AuthEntryScreen(userRole: userRole);
          },
        ),
        GoRoute(
          path: AuthenticationPaths.otpVerification,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>? ?? {};
            return OTPVerificationScreen(
              userInput: extra[AuthRouteParams.userInput] ?? '',
              verificationId: extra[AuthRouteParams.verificationId] ?? '',
            );
          },
        ),
        GoRoute(
          path: AuthenticationPaths.completeProfile,
          builder: (context, state) => const CompleteProfileScreen(),
        ),
      ],
    ),
  ];
}
