import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/onboarding/app_intro_slider.dart';
import 'package:design_system/design_system.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthEllipseBackground(
        child: Stack(
          children: [
            AppIntroSlider(),
            Positioned(
              top:
                  MediaQuery.of(context).padding.top +
                  38, // Top padding is required instead of safe area
              right: 17,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  AuthInternalRouter.of(context).toLogin();
                },
                child: UIText.buttonText('skip', color: UIColor.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
