import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/helper/profile_language_label_extension.dart';
import 'package:profile/src/presentation/actions/profile_actions.dart';
import 'package:profile/src/presentation/widget/setting_option_profile_widget.dart';

class ProfileSettingWidget extends StatelessWidget {
  const ProfileSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLanguage = context.currentProfileLanguageLabel;

    return UICardContainer(
      padding: UI.padding.profileOptionsCardContent,
      child: Column(
        children: [
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.location,
            descreption: 'my location I selected UEA',
            imgUrl: Assets.icons.profile,
            onTap: () {
              // log('pressed on FAQ button');
            },
          ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.driverProfile.language,
            imgUrl: Assets.icons.profile,
            customTrailing: Row(
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
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.savedBeneficiary,
            descreption: 'Manage your saved account',
            imgUrl: Assets.icons.profile,
            onTap: () {
              // log('pressed on FAQ button');
            },
          ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.termsAndPrivacy.privacyPolicy,
            descreption:
                context.profileTranslation.termsAndPrivacy.privacyPolicy,
            imgUrl: Assets.icons.shieldDone,
            onTap: () {
              // log('pressed on FAQ button');
            },
          ),
          // ProfileSettingOptionWidget(
          //   title: context.profileTranslation.option.faq,
          //   descreption: 'FAQ',
          //   imgUrl: Assets.icons.shieldDone,
          //   onTap: () {
          //     // log('pressed on FAQ button');
          //   },
          // ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.contact,
            descreption: 'Contact Us',
            imgUrl: Assets.icons.shieldDone,
            onTap: () {
              // log('pressed on FAQ button');
            },
          ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.logout,
            descreption: 'Log out',
            imgUrl: Assets.icons.logOut,
            colorIcon: UIColor.errorDark,
            color: UIColor.backgroungAvaterRed,
            onTap: () => ProfileActions.onLogoutPressed(context),
          ),
          // ProfileSettingOptionWidget(
          //   title: context.profileTranslation.option.deleteAccount,
          //   descreption: context.profileTranslation.option.DeleteMyAccount,
          //   imgUrl: Assets.icons.logOut,
          //   color: UIColor.backgroungAvaterRed,
          //   colorIcon: UIColor.iconsAvaterRed,
          //   onTap: () => ProfileActions.onDeleteAccountPressed(context),
          // ),
        ],
      ),
    );
  }
}
