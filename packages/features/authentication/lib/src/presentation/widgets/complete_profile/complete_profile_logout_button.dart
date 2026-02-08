import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

/// Logout button widget for complete profile screen
class CompleteProfileLogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const CompleteProfileLogoutButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    return GestureDetector(
      onTap: onLogout,
      child: Text(
        tr.common.logout,
        style: UI.text.bodySmall.copyWith(
          color: UIColor.error,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
