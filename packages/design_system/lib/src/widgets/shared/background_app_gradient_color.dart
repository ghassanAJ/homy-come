import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class UIBackground extends StatelessWidget {
  const UIBackground({super.key, required this.content});
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: AlignmentGeometry.topLeft,
          radius: 0.6,
          colors: [UIColor.softGreen, UIColor.background],
        ),
      ),
      child: content,
    );
  }
}
