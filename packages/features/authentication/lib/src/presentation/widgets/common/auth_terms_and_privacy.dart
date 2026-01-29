import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';

class AuthTermsAndPrivacy extends StatelessWidget {
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const AuthTermsAndPrivacy({super.key, this.onTermsTap, this.onPrivacyTap});

  @override
  Widget build(BuildContext context) {
    final tr = AuthenticationTranslation();

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: UI.text.caption.copyWith(color: UIColor.textSecondary),
        children: [
          TextSpan(text: '${tr.termsAndPrivacy.agreementText} '),
          TextSpan(
            text: tr.termsAndPrivacy.termsOfUse,
            style: UI.text.caption.copyWith(
              color: UIColor.primary,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          TextSpan(text: ' ${tr.termsAndPrivacy.and} '),
          TextSpan(
            text: tr.termsAndPrivacy.privacyPolicy,
            style: UI.text.caption.copyWith(
              color: UIColor.primary,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),
        ],
      ),
    );
  }
}
