import 'package:design_system/design_system.dart';

/// Reusable decorative ellipse background for app screens.
///
/// By default ellipses are rendered behind [child].
/// Set [paintOnTop] to true to render them as a subtle global overlay.
class UIEllipseBackground extends StatelessWidget {
  const UIEllipseBackground({
    super.key,
    required this.child,
    this.showTopLeftEllipse = true,
    this.showBottomRightEllipse = true,
    this.paintOnTop = false,
  });

  final Widget child;
  final bool showTopLeftEllipse;
  final bool showBottomRightEllipse;
  final bool paintOnTop;

  @override
  Widget build(BuildContext context) {
    final decorations = IgnorePointer(
      child: Stack(
        children: [
          if (showTopLeftEllipse)
            Positioned(
              top: -150,
              left: -150,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      UIColor.softGreen.withValues(alpha: 0.2),
                      UIColor.white,
                    ],
                    stops: const [0.0, 0.4],
                  ),
                ),
              ),
            ),
          if (showBottomRightEllipse)
            Positioned(
              bottom: 0,
              right: -150,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      UIColor.babyPink.withValues(alpha: 0.3),
                      UIColor.white,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    if (paintOnTop) {
      return Stack(children: [child, decorations]);
    }

    return Stack(children: [decorations, child]);
  }
}
