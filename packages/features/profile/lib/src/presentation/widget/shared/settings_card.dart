import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/helper/profile_language_label_extension.dart';
import 'package:profile/src/presentation/widget/shared/settings_row.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.onLogout,
  });

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final currentLanguage = context.currentProfileLanguageLabel;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: UIColor.background),
      child: Column(
        children: [
          SettingsRow(title: context.profileTranslation.option.job),
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
            onTap: ProfileInternalRouter.of(context).toDriverLanguageSettings,
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
}
