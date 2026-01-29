import 'package:design_system/design_system.dart';

/// Logout button widget for complete profile screen
class CompleteProfileLogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const CompleteProfileLogoutButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLogout,
      child: Text(
        'Logout',
        style: UI.text.bodySmall.copyWith(
          color: UIColor.error,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
