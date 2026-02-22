import 'package:authentication/src/presentation/widgets/common/onboarding_bubble.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final smallBubbleSize = UI.spacing.sm;
    final largeBubbleSize = UI.spacing.xl + UI.spacing.sm;

    // Splash should cover the whole screen safely (notch/status bar),
    // without changing the page content (same gradient + same dots).
    return Scaffold(
      backgroundColor: UIColor.white.withOpacity(0),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [UIColor.babyPink, UIColor.softYellow],
                  ),
                ),
              ),
            ),
            OnboardingBubble(
              spec: OnboardingBubbleSpec(
                top: 40,
                right: -18,
                size: largeBubbleSize,
              ),
            ),
            Positioned(
              top: 155,
              left: 0,
              right: 0,
              child: Center(child: OnboardingBubbleDot(size: smallBubbleSize)),
            ),
            OnboardingBubble(
              spec: OnboardingBubbleSpec(
                bottom: 170,
                left: -2,
                size: smallBubbleSize,
              ),
            ),
            OnboardingBubble(
              spec: OnboardingBubbleSpec(
                bottom: 104,
                right: 12,
                size: smallBubbleSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
