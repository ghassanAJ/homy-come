import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class AuthInternalRouter {
  final BuildContext context;

  const AuthInternalRouter(this.context);

  void goBack() {
    context.pop();
  }

  void toOnboarding() {
    context.go(AuthenticationPaths.onboarding);
  }

  void toLogin() {
    context.go(AuthenticationPaths.login);
  }

  void toSelectRole() {
    context.go(AuthenticationPaths.selectRole);
  }

  void toAuthEntry({required UserRole userRole}) {
    context.push(
      AuthenticationPaths.authEntry,
      extra: {AuthRouteParams.userRole: userRole.value},
    );
  }

  void toOtpVerification({
    required String verificationId,
    required String userInput,
    required String userType,
  }) {
    context.push(
      AuthenticationPaths.otpVerification,
      extra: {
        AuthRouteParams.verificationId: verificationId,
        AuthRouteParams.userInput: userInput,
        AuthRouteParams.userType: userType,
      },
    );
  }

  void toCompleteProfile() {
    context.pushReplacement(AuthenticationPaths.completeProfile);
  }

  static AuthInternalRouter of(BuildContext context) {
    return AuthInternalRouter(context);
  }
}
