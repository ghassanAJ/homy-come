import 'package:flutter/material.dart';

/// A reusable background widget with decorative ellipses for authentication screens.
///
/// Features two blurred ellipses:
/// - Top-left ellipse with cyan color (#C0FBFA)
/// - Mid-right ellipse with purple color (#BBB0FF)
class AuthEllipseBackground extends StatelessWidget {
  final Widget child;

  const AuthEllipseBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-left ellipse
        Positioned(
          top: 0,
          left: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFC0FBFA).withValues(alpha: 0.6),
                  const Color(0xFFC0FBFA).withValues(alpha: 0.0),
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
        ),

        // Mid-right ellipse
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          right: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFBBB0FF).withValues(alpha: 0.6),
                  const Color(0xFFBBB0FF).withValues(alpha: 0.0),
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
        ),

        // Content
        child,
      ],
    );
  }
}
