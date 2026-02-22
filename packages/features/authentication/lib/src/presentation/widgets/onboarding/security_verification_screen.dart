import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 340),
            padding: EdgeInsets.fromLTRB(
              UI.spacing.xl,
              UI.spacing.xl,
              UI.spacing.xl,
              UI.spacing.xl,
            ),
            decoration: BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.circular(UI.radius.lg),
              boxShadow: [
                BoxShadow(
                  color: UIColor.black.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: UIColor.babyPink,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: SvgPicture.asset(
                      Assets.icons.smileyXEyes,
                      package: 'design_system',
                    ),
                  ),
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
