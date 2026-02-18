import 'package:flutter/material.dart';

class AuthEllipseBackground extends StatelessWidget {
  final Widget child;

  const AuthEllipseBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -150,
          left: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0xFFD6F0C0), Color(0x00FFFFFF)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),

        child,
      ],
    );
  }
}
