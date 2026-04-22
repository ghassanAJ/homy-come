import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';

final class ProfileActions {
  const ProfileActions._();

  static Future<bool> _showDestructiveConfirmation({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return DialogsManager.showDeleteConfirmation(
      context,
      title: title,
      description: description,
    );
  }

  static Future<void> onLogoutPressed(BuildContext context) async {
    final isConfirmed = await UIBottomSheet.show(
      context: StatefulNavigationShell.of(context).context,
      content: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            UIText.bodyLarge('Logout', fontWeight: FontWeight.w600),
            SizedBox(height: 8),
            UIText.bodySmall(
              'Are you sure to logout?',
              color: UIColor.neutral500,
            ),
            SizedBox(height: 16),
            UIButton.primary(
              expanded: true,
              label: 'Stay logged in',
              onPressed: () {
                context.pop();
              },
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: UIText.bodySmall(
                'Confirm logout',
                color: UIColor.iconsAvaterRed,
              ),
            ),
          ],
        ),
      ),
    );

    if (!context.mounted || !isConfirmed) return;
    context.read<AuthUserBloc>().add(Logout());
  }

  static Future<void> onDeleteAccountPressed(
    BuildContext context, {
    FutureOr<void> Function()? onConfirmed,
  }) async {
    final isConfirmed = await _showDestructiveConfirmation(
      context: context,
      title: context.profileTranslation.option.deleteAccount,
      description:
          context
              .profileTranslation
              .driverProfile
              .deleteAccountConfirmDescription,
    );

    if (!context.mounted || !isConfirmed) return;
    await onConfirmed?.call();
  }
}
