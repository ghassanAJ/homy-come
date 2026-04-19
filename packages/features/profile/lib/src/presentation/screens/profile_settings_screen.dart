import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/actions/profile_actions.dart';
import 'package:profile/src/presentation/widget/shared/settings_card.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      appBar: UIAppBar(
        title: context.profileTranslation.driverProfile.settings,
      ),
      body: SingleChildScrollView(
        padding: UI.padding.driverProfileSettingsContent(topInset: 12),
        child: SettingsCard(
          onLogout: () => ProfileActions.onLogoutPressed(context),
        ),
      ),
    );
  }
}
