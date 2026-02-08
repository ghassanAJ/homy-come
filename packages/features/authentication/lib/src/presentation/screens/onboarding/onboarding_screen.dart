import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:authentication/src/presentation/widgets/onboarding/app_intro_slider.dart';
import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
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
                child: UIText.buttonText(
                  tr.onboarding.skip,
                  color: UIColor.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
