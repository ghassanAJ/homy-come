import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final isConfirmed = await _showDestructiveConfirmation(
      context: context,
      title: context.profileTranslation.option.logout,
      description:
          context.profileTranslation.driverProfile.logoutConfirmDescription,
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
