import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

/// Submit button widget for auth entry screen
///
/// Handles both PIN mode and OTP mode submit buttons with validation
class AuthEntrySubmitButton extends StatelessWidget {
  final bool isPinMode;
  final ValueNotifier<String>? pinNotifier;
  final ValueNotifier<bool>? isFormValidNotifier;
  final VoidCallback? onPinSubmit;
  final VoidCallback? onOTPSubmit;

  const AuthEntrySubmitButton({
    super.key,
    required this.isPinMode,
    this.pinNotifier,
    this.isFormValidNotifier,
    this.onPinSubmit,
    this.onOTPSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    if (isPinMode) {
      return ValueListenableBuilder<String>(
        valueListenable: pinNotifier ?? ValueNotifier(''),
        builder: (context, pinValue, _) {
          final isValid = pinValue.length == AuthenticationConfig.pinLength;
          return UIButton.primary(
            label: tr.authEntry.loginButton,
            onPressed: isValid ? onPinSubmit : null,
            expanded: true,
          );
        },
      );
    }
    return ValueListenableBuilder<bool>(
      valueListenable: isFormValidNotifier ?? ValueNotifier(false),
      builder: (context, isValid, _) {
        return UIButton.primary(
          label: tr.authEntry.sendVerificationCode,
          onPressed: isValid ? onOTPSubmit : null,
          expanded: true,
        );
      },
    );
  }
}
