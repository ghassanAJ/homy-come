import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';

/// Widget displaying resend code option with countdown timer
///
/// Shows "Didn't receive code? Resend" when timer expires,
/// or "Resend MM:SS" while timer is active
class OTPResendSection extends StatelessWidget {
  final ResendTimerController resendTimer;
  final VoidCallback onResend;

  const OTPResendSection({
    super.key,
    required this.resendTimer,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UIText.bodySmall('Didn\'t receive?', color: UIColor.textSecondary),
        const SizedBox(height: 4),
        if (resendTimer.canResend)
          GestureDetector(
            onTap: onResend,
            child: Text(
              'Resend Code',
              style: UI.text.bodySmall.copyWith(
                color: UIColor.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        else
          Text(
            '${'resend'} ${resendTimer.formattedTime}',
            style: UI.text.bodySmall.copyWith(
              color: UIColor.textPlaceholder,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
