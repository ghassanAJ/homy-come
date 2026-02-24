import 'package:design_system/design_system.dart';
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
                  UIColor.softGreen.withValues(alpha: 0.8),
                  UIColor.white,
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
                    UIColor.babyPink.withValues(alpha: 0.3),
                    UIColor.white,
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
