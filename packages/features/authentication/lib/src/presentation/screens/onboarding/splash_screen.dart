import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Splash should cover the whole screen safely (notch/status bar),
    // without changing the page content (same gradient + same dots).
    return Scaffold(
      backgroundColor: UIColor.white.withOpacity(0),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [UIColor.babyPink, UIColor.softYellow],
                  ),
                ),
              ),
            ),
              
            const Positioned(
              top: 40,
              right: -18,
              child: _SplashDot(size: 44),
            ),
            const Positioned(
              top: 155,
              left: 0,
              right: 0,
              child: Center(child: _SplashDot(size: 12)),
            ),
            const Positioned(
              bottom: 170,
              left: -2,
              child: _SplashDot(size: 12),
            ),
            const Positioned(
              bottom: 104,
              right: 12,
              child: _SplashDot(size: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashDot extends StatelessWidget {
  final double size;

  const _SplashDot({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: UIColor.softGreen,
        shape: BoxShape.circle,
      ),
    );
  }
}
