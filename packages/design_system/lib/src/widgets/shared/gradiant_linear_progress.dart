import '../../../design_system.dart';

/// A simple, reusable linear gradient progress bar with smooth animation.
class UIGradientLinearProgress extends StatelessWidget {
  /// Progress value between 0.0 and 1.0 (clamped).
  final double value;

  /// Height of the progress bar.
  final double height;

  /// Border radius of the bar.
  final BorderRadius borderRadius;

  /// Gradient for the filled portion.
  final Gradient gradient;

  /// Background color for the unfilled portion.
  final Color backgroundColor;

  /// Animation duration when the value changes.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Optional elevation/shadow (applies to the whole bar).
  final double elevation;

  const UIGradientLinearProgress({
    super.key,
    required this.value,
    this.height = 8.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.gradient = const LinearGradient(
      colors: [Color(0xffB0FFFE), Color(0xff6ADBDA)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    this.backgroundColor = const Color(0xffFBFAFF),
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeOutCubic,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    // clamp value to [0,1]
    final clamped = value.isNaN ? 0.0 : value.clamp(0.0, 1.0);

    return Material(
      elevation: elevation,
      color: Colors.transparent,
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  // background (unfilled)
                  Container(color: backgroundColor),
                  // animated filled part
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: clamped),
                    duration: duration,
                    curve: curve,
                    builder: (context, animatedValue, child) {
                      // FractionallySizedBox sizes by fraction of parent's width.
                      return FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: animatedValue,
                        child: child,
                      );
                    },
                    child: Container(
                      // Use ShaderMask to apply gradient to the fill area.
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: borderRadius,
                      ),
                    ),
                  ),
                  // optional overlay for subtle glossy effect (comment out if unwanted)
                  // Positioned.fill(
                  //   child: IgnorePointer(
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         gradient: LinearGradient(
                  //           colors: [Colors.white.withOpacity(0.06), Colors.transparent],
                  //           begin: Alignment.topCenter,
                  //           end: Alignment.bottomCenter,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
