import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/src/navigation/router.dart';

class ProfileInternalRouter {
  final BuildContext context;

  const ProfileInternalRouter(this.context);

  void goBack() {
    if (context.canPop()) {
      context.pop();
    }
  }

  void toProfile() {
    context.go(ProfilePaths.profile);
  }

  void toTermsAndCondition() {
    context.push(ProfilePaths.termsAndCondition);
  }

  void toAboutApp() {
    context.push(ProfilePaths.aboutApp);
  }

  void toDriverProfileSettings() {
    context.push(ProfilePaths.driverProfileSettings);
  }

  void toDriverLanguageSettings() {
    context.push(ProfilePaths.driverLanguageSettings);
  }

  void toProviderAllReviews() {
    context.push(ProfilePaths.providerAllReviews);
  }

  static ProfileInternalRouter of(BuildContext context) {
    return ProfileInternalRouter(context);
  }
}
