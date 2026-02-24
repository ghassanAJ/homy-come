import 'package:design_system/design_system.dart';

class OnboardingBubbleSpec {
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final double? size;

  const OnboardingBubbleSpec({
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.size,
  });
}

class OnboardingBubble extends StatelessWidget {
  final OnboardingBubbleSpec spec;
  final Color color;
  final double? defaultSize;

  const OnboardingBubble({
    super.key,
    required this.spec,
    this.color = UIColor.softGreen,
    this.defaultSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = spec.size ?? defaultSize ?? UI.spacing.md;
    return Positioned(
      top: spec.top,
      right: spec.right,
      bottom: spec.bottom,
      left: spec.left,
      child: OnboardingBubbleDot(size: size, color: color),
    );
  }
}

class OnboardingBubbleDot extends StatelessWidget {
  final double size;
  final Color color;

  const OnboardingBubbleDot({
    super.key,
    required this.size,
    this.color = UIColor.softGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
