import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/onboarding/app_intro_slider.dart';
import 'package:authentication/src/presentation/widgets/onboarding/onboarding_intro_screen.dart';
import 'package:authentication/src/presentation/widgets/onboarding/security_verification_screen.dart';
import 'package:design_system/design_system.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0;

  void _openSlider() {
    setState(() {
      _step = 1;
    });
  }

  void _openSecurityVerification() {
    setState(() {
      _step = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    late final Widget content;
    if (_step == 0) {
      content = OnboardingIntroPage(onGetStarted: _openSlider);
    } else if (_step == 1) {
      content = AuthEllipseBackground(
        child: AppIntroSlider(onComplete: _openSecurityVerification),
      );
    } else {
      content = AuthEllipseBackground(
        showBottomRightEllipse: true,
        child: SecurityVerificationScreen(
          onStartVerify: () => AuthInternalRouter.of(context).toLogin(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: UIColor.background,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 280),
        child: content,
      ),
    );
  }
}
