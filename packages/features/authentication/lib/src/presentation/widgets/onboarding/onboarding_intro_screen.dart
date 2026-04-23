import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/common/onboarding_bubble.dart';
import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

class OnboardingIntroPage extends StatelessWidget {
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
    final mediaQuery = MediaQuery.of(context);
    final safePadding = mediaQuery.padding;
    final subtitleSpacing = UI.spacing.md + UI.spacing.xxs;
    final imageSpacing = UI.spacing.lg;

    return Scaffold(
      body: Stack(
        children: [
          ..._decorativeBubbles.map((bubble) => OnboardingBubble(spec: bubble)),
          Padding(
            padding: UI.padding.onboardingIntroContent(
              screenHeight: mediaQuery.size.height,
              safeTop: safePadding.top,
              safeBottom: safePadding.bottom,
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
                  // package: 'design_system',
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                Padding(
                  padding: UI.padding.onboardingActionsBottomOnly,
                  child: UIButton.primary(
                    label: tr.onboarding.getStarted,
                    expanded: true,
                    onPressed: onGetStarted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
