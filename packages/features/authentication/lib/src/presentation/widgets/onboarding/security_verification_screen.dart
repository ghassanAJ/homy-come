import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:util/util.dart';

class SecurityVerificationScreen extends StatelessWidget {
  final VoidCallback? onStartVerify;

  const SecurityVerificationScreen({super.key, this.onStartVerify});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();

    return SafeArea(
      child: Center(
        child: Padding(
          padding: UI.padding.horizontalLg,
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 340),
            padding: UI.padding.allXl,
            decoration: BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.circular(UI.radius.lg),
              boxShadow: UI.shadows.lg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIIconBackground(
                  size: 90,
                  iconSize: 45,
                  backgroundColor: UIColor.babyPink,
                  child: UISvg(Assets.icons.smileyXEyes),
                  child: UISvg(Assets.icons.smileyXEyes),
                ),

                SizedBox(height: UI.spacing.lg),
                UIText.bodyMedium(
                  tr.onboarding.securityVerificationTitle,
                  textAlign: TextAlign.center,
                  color: UIColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: UI.spacing.md),
                UIText.bodySmall(
                  tr.onboarding.securityVerificationDescription,
                  textAlign: TextAlign.center,
                  color: UIColor.textSecondary,
                ),
                SizedBox(height: UI.spacing.xl),
                UIButton.primary(
                  label: tr.onboarding.startToVerify,
                  onPressed: onStartVerify ?? () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
