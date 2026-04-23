import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/helper/profile_language_label_extension.dart';
import 'package:profile/src/navigation/router.dart';
import 'package:profile/src/presentation/actions/profile_actions.dart';
import 'package:profile/src/presentation/widget/setting_option_profile_widget.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';

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
            descreption:
                'I selected ${context.read<AppCubit>().state.user?.address ?? 'UAE'} ',
            imgUrl: Assets.icons.location,
            onTap: () {
              LocationSetterUtil.pushToSetLocationScreen(context);

              // context.push()
              // log('pressed on FAQ button');
            },
          ),
          // ProfileSettingOptionWidget(
          //   title: context.profileTranslation.driverProfile.language,
          //   imgUrl: Assets.icons.profile,
          //   customTrailing: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       UIText.bodySmall(
          //         currentLanguage,
          //         color: UIColor.textGray,
          //         fontWeight: FontWeight.w500,
          //       ),
          //       SizedBox(width: UI.spacing.xs),
          //       UISvg(
          //         Assets.icons.arrowRightSvg,
          //         color: UIColor.textGray,
          //         matchTextDirection: true,
          //       ),
          //     ],
          //   ),
          //   onTap: ProfileInternalRouter.of(context).toDriverLanguageSettings,
          // ),
          // // ProfileSettingOptionWidget(
          //   title: context.profileTranslation.option.savedBeneficiary,
          //   descreption: 'Manage your saved account',
          //   imgUrl: Assets.icons.profile,
          //   onTap: () {
          //     // log('pressed on FAQ button');
          //   },
          // ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.termsAndPrivacy.privacyPolicy,
            descreption:
                context.profileTranslation.termsAndPrivacy.privacyPolicy,
            imgUrl: Assets.icons.shieldDone,
            onTap: () {
              context.push(ProfilePaths.privacy);

              // log('pressed on FAQ button');
            },
          ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.faq,
            descreption: 'FAQ',
            imgUrl: Assets.images.help1.path,
            isSvgIcon: false,
            // colorIcon: UIColor.borderFocused,
            onTap: () {
              context.push(ProfilePaths.faq);
              // log('pressed on FAQ button');
            },
          ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.contact,
            descreption: 'Contact Us',
            isSvgIcon: false,
            imgUrl: Assets.images.support.path,
            onTap: () {
              context.push(ProfilePaths.help);

              // log('pressed on FAQ button');
            },
          ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.logout,
            descreption: 'Log out',
            imgUrl: Assets.icons.logOut,
            colorIcon: UIColor.error,
            color: UIColor.backgroungAvaterRed,
            onTap: () {
              ProfileActions.onLogoutPressed(context);
            },

            // ProfileActions.onLogoutPressed(context),
          ),
          ProfileSettingOptionWidget(
            title: context.profileTranslation.option.deleteAccount,
            descreption: context.profileTranslation.option.deleteAccount,
            imgUrl: Assets.icons.trash,
            color: UIColor.backgroungAvaterRed,
            colorIcon: UIColor.error,
            onTap: () => ProfileActions.onDeleteAccountPressed(context),
          ),
        ],
      ),
    );
  }
}
