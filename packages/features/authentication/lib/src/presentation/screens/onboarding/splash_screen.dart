import 'package:design_system/design_system.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation is handled by AppRouterGuard based on AppState.isInitializing
    // The splash screen stays visible until biometric check completes
    return Scaffold(
      backgroundColor: UIColor.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Icon(Icons.check, size: 40),

          // Image.asset('assets/Logo.png', package: 'authentication'),
        ),
      ),
    );
  }
}
