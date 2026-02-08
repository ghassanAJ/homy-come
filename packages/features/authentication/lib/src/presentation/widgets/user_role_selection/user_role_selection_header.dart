import 'package:design_system/design_system.dart';

/// Header widget for user role selection screen
///
/// Displays welcome message with emoji, title, and subtitle
class UserRoleSelectionHeader extends StatelessWidget {
  const UserRoleSelectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Waving hand emoji
        const Text('👋', style: TextStyle(fontSize: 48)),
        const SizedBox(height: 24),

        // Welcome Title
        UIText.h1('welcome', color: UIColor.textPrimary),
        const SizedBox(height: 8),

        // Subtitle
        UIText.bodyMedium('welcomeSubtitle', color: UIColor.textSecondary),
      ],
    );
  }
}
