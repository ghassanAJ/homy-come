import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

class AuthEntryHeader extends StatelessWidget {
  final AuthMethod currentMethod;
  final bool isChildMode;

  const AuthEntryHeader({
    super.key,
    required this.currentMethod,
    required this.isChildMode,
  });

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    String title;
    String subtitle;

    if (currentMethod == AuthMethod.pin) {
      title = isChildMode ? tr.childLogin.title : tr.authEntry.loginButton;
      subtitle = isChildMode ? tr.childLogin.subtitle : tr.authEntry.pinLabel;
    } else if (currentMethod == AuthMethod.email) {
      title = tr.authIdentity.emailTitle;
      subtitle = tr.authIdentity.emailSubtitle;
    } else {
      title = tr.authIdentity.phoneTitle;
      subtitle = tr.authIdentity.phoneSubtitle;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated title
        AnimatedSwitcher(
          duration: Duration(
            milliseconds: AuthUIConstants.headerAnimationDurationMs,
          ),
          child: UIText.h1(title, key: ValueKey('title_$currentMethod')),
        ),
        SizedBox(height: UI.spacing.xs),

        // Animated subtitle
        AnimatedSwitcher(
          duration: Duration(
            milliseconds: AuthUIConstants.headerAnimationDurationMs,
          ),
          child: UIText.bodySmall(
            subtitle,
            key: ValueKey('subtitle_$currentMethod'),
            color: UIColor.textSecondary,
          ),
        ),
        SizedBox(height: UI.spacing.xl),
      ],
    );
  }
}
