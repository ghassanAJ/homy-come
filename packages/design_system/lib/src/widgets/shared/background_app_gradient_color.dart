import 'package:design_system/design_system.dart';

class UIBackground extends StatelessWidget {
  const UIBackground({
    super.key,
    this.child,
    this.showTopLeftEllipse = true,
    this.showBottomRightEllipse = false,
  });

  final Widget? child;
  final bool showTopLeftEllipse;
  final bool showBottomRightEllipse;

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

    final content = SafeArea(child: Offstage(offstage: false, child: child));

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          center: Alignment.topLeft,
          radius: .9,
          colors: [UIColor.softGreen, UIColor.background],
        ),
      ),
      child: child,
    );
  }
}
