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

  Widget _buildSliderContent() {
    switch (_step) {
      case 0:
        return OnboardingIntroPage(onGetStarted: _openSlider);

      case 1:
      default:
        return AuthEllipseBackground(
          child: AppIntroSlider(
            onComplete: () => AuthInternalRouter.of(context).toLogin(),
            // _openSecurityVerification
          ),
        );
      // case 2:
      // default:
      //   return AuthEllipseBackground(
      //     showBottomRightEllipse: true,
      //     child: SecurityVerificationScreen(
      //       onStartVerify: () => AuthInternalRouter.of(context).toLogin(),
      //     ),
      //   );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.background,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 280),
        child: _buildSliderContent(),
      ),
    );
  }
}
