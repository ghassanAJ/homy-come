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
    return UIEllipseBackground(
      showTopLeftEllipse: true,
      showBottomRightEllipse: showBottomRightEllipse,
      child: child,
    );
  }
}
