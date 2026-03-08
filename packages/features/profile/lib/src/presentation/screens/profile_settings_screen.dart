import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/actions/profile_actions.dart';
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
        leading: const BackButtonAppBar(),
      ),
      body: SingleChildScrollView(
        padding: UI.padding.driverProfileSettingsContent(
          topInset: topContentPadding,
        ),
        child: SettingsCard(
          onLogout: () => ProfileActions.onLogoutPressed(context),
        ),
      ),
    );
  }
}
