import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/user_role_selection/user_role_option.dart';
import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

/// Role options section widget for user role selection screen
///
/// Displays all available role options and continue button
class UserRoleSelectionOptions extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onRoleChanged;

  const UserRoleSelectionOptions({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserRoleOption(
          label: 'user',
          isSelected: selectedRole == UserRole.user,
          onTap: () => onRoleChanged(UserRole.user),
        ),

        const SizedBox(height: 12),

        UserRoleOption(
          label: 'driver',
          isSelected: selectedRole == UserRole.driver,
          onTap: () => onRoleChanged(UserRole.driver),
        ),

        const SizedBox(height: 12),

        UserRoleOption(
          label: 'provider',
          isSelected: selectedRole == UserRole.provider,
          onTap: () => onRoleChanged(UserRole.provider),
        ),

        const SizedBox(height: 24),

        // Continue Button
        UIButton.primary(
          label: 'translations.userRole.continueButton',
          onPressed: () {
            if (selectedRole.isProvider) {
              ToastificationUtil.error(
                ' translations.userRole.guestModeNotSupported',
              );
              return;
            }

            AuthInternalRouter.of(context).toAuthEntry(userRole: selectedRole);
          },
          expanded: true,
        ),
      ],
    );
  }
}
