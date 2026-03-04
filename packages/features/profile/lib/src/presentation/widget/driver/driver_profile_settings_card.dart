import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/navigation/router.dart';
import 'package:profile/src/presentation/widget/driver/driver_profile_settings_row.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.onLogout,
  });

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final currentLanguage = _currentLanguageLabel(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: UIColor.background),
      child: Column(
        children: [
          SettingsRow(title: context.profileTranslation.option.Job),
          SettingsRow(
            title: context.profileTranslation.driverProfile.language,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIText.bodySmall(
                  currentLanguage,
                  color: UIColor.textGray,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: UI.spacing.xs),
                UISvg(
                  Assets.icons.arrowRightSvg,
                  color: UIColor.textGray,
                  matchTextDirection: true,
                ),
              ],
            ),
            onTap: () {
              context.push(ProfilePaths.driverLanguageSettings);
            },
          ),
          SettingsRow(
            title: context.profileTranslation.termsAndPrivacy.privacyPolicy,
          ),
          SettingsRow(title: context.profileTranslation.option.contact),
          SettingsRow(title: context.profileTranslation.option.faq),
          SettingsRow(
            title: context.profileTranslation.option.logout,
            titleColor: UIColor.errorDark,
            onTap: onLogout,
            showDivider: false,
          ),
        ],
      ),
    );
  }

  String _currentLanguageLabel(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'ar') return 'العربية';
    return 'English';
  }
}
