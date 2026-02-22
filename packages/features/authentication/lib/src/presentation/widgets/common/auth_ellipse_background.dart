import 'package:flutter/material.dart';

/// A reusable background widget with decorative ellipses for authentication screens.
///
/// Features:
/// - Top-left ellipse (always visible)
/// - Optional bottom-right ellipse
class AuthEllipseBackground extends StatelessWidget {
  final Widget child;

  /// Controls visibility of bottom-right ellipse
  final bool showBottomRightEllipse;

  const AuthEllipseBackground({
    super.key,
    required this.child,
    this.showBottomRightEllipse = false, // default hidden
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-left ellipse (always visible)
        Positioned(
          top: -150,
          left: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xFFD6F0C0).withValues(alpha: 0.8),
                  Color(0xFFFFFFFF),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),

        // Bottom-right ellipse (optional)
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
                    const Color(0xFFFAB4F0).withValues(alpha: 0.3),
                    const Color(0xFFFFFFFF),
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
