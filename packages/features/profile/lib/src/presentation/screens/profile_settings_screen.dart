import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/shared/settings_card.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        title: context.profileTranslation.driverProfile.settings,
        leading: GestureDetector(
          onTap: () {
            if (context.canPop()) context.pop();
          },
          child: const BackButtonAppBar(),
        ),
      ),
      body: SingleChildScrollView(
        padding: UI.padding.driverProfileSettingsContent(
          topInset: topContentPadding,
        ),
        child: SettingsCard(onLogout: () => _onLogoutPressed(context)),
      ),
    );
  }

  Future<void> _onLogoutPressed(BuildContext context) async {
    final isConfirmed = await DialogsManager.showDeleteConfirmation(
      context,
      title: context.profileTranslation.option.logout,
      description:
          context.profileTranslation.driverProfile.logoutConfirmDescription,
    );
    if (!context.mounted || !isConfirmed) return;
    context.read<AuthUserBloc>().add(Logout());
  }
}
