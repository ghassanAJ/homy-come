import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:util/util.dart';

class OnboardingIntroPage extends StatelessWidget {
  final VoidCallback onGetStarted;

  const OnboardingIntroPage({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    return Stack(
      children: [
        Positioned(
          top: -31,
          right: -26,
          child: Container(
            width: 246,
            height: 246,
            decoration: const BoxDecoration(
              color: UIColor.softGreen,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 178,
          left: 12,
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: UIColor.softGreen,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 170,
          left: 12,
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: UIColor.softGreen,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          right: 18,
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: UIColor.softGreen,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(UI.spacing.lg, 130, UI.spacing.lg, UI.spacing.xl),
          child: Column(
            children: [
              UIText.h1(
                tr.onboarding.introTitle,
                textAlign: TextAlign.center,
                color: UIColor.balck,
              ),

              const SizedBox(height: 20),
              UIText.bodySmall(
                tr.onboarding.introSubtitle,
                textAlign: TextAlign.center,
                color: UIColor.balck,
              ),
              SizedBox(height: UI.spacing.lg),
              Assets.images.onboarding.image(
                package: 'design_system',
                fit: BoxFit.contain,
              ),
              const Spacer(),
              UIButton.primary(
                label: tr.onboarding.getStarted,
                expanded: true,
                onPressed: onGetStarted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
