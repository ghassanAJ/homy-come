import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';

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
    if (isPinMode) {
      return ValueListenableBuilder<String>(
        valueListenable: pinNotifier ?? ValueNotifier(''),
        builder: (context, pinValue, _) {
          final isValid = pinValue.length == AuthenticationConfig.pinLength;
          return UIButton.primary(
            label: 'login',
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
          label: 'send verification code',
          onPressed: isValid ? onOTPSubmit : null,
          expanded: true,
        );
      },
    );
  }
}
