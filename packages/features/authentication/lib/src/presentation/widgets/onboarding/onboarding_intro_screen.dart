import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/common/onboarding_bubble.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:util/util.dart';

class OnboardingIntroPage extends StatelessWidget {
  static const double _contentTopPadding = 130;
  static const double _heroCircleSize = 246;
  static const double _rightBubbleOffset = 18;

  static const List<OnboardingBubbleSpec> _decorativeBubbles = [
    OnboardingBubbleSpec(top: -31, right: -26, size: _heroCircleSize),
    OnboardingBubbleSpec(top: 230, left: 12),
    OnboardingBubbleSpec(bottom: 270, left: 12),
    OnboardingBubbleSpec(bottom: 120, right: _rightBubbleOffset),
  ];

  final VoidCallback onGetStarted;

  const OnboardingIntroPage({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    final horizontalPadding = UI.spacing.lg;
    final bottomPadding = UI.spacing.xl;
    final subtitleSpacing = UI.spacing.md + UI.spacing.xxs;
    final imageSpacing = UI.spacing.lg;

    return Stack(
      children: [
        ..._decorativeBubbles.map((bubble) => OnboardingBubble(spec: bubble)),
        Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            _contentTopPadding,
            horizontalPadding,
            bottomPadding,
          ),
          child: Column(
            children: [
              UIText.h1(
                tr.onboarding.introTitle,
                textAlign: TextAlign.center,
                color: UIColor.balck,
              ),
              SizedBox(height: subtitleSpacing),
              UIText.bodySmall(
                tr.onboarding.introSubtitle,
                textAlign: TextAlign.center,
                color: UIColor.balck,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: imageSpacing),
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
