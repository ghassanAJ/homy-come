import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/onboarding/app_intro_slider.dart';
import 'package:authentication/src/presentation/widgets/onboarding/onboarding_intro_screen.dart';
import 'package:design_system/design_system.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _showIntroPage = true;

  void _openSlider() {
    setState(() {
      _showIntroPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.background,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 280),
        child:
            _showIntroPage
                ? OnboardingIntroPage(onGetStarted: _openSlider)
                : const AuthEllipseBackground(child: AppIntroSlider()),
      ),
    );
  }
}
