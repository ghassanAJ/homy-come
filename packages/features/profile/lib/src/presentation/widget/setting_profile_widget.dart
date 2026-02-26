import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/setting_option_profile_widget.dart';

class ProfileSettingWidget extends StatelessWidget {
  const ProfileSettingWidget({super.key, required this.isActiveNotification});

  final ValueNotifier<bool> isActiveNotification;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UI.radius.xs),
        color: UIColor.background,
        boxShadow: UI.shadows.cardMd,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          UI.spacing.md,
          UI.spacing.lg,
          UI.spacing.md,
          0,
        ),
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
              title: context.profileTranslation.option.savedBeneficiary,
              descreption: 'Manage your saved account',
              imgUrl: Assets.icons.profile,
              onTap: () {
                // log('pressed on FAQ button');
              },
            ),

            ProfileSettingOptionWidget(
              title: context.profileTranslation.option.notification,
              descreption: 'app notifications',
              imgUrl: Assets.icons.lock,
              customTrailing: ValueListenableBuilder(
                valueListenable: isActiveNotification,
                builder:
                    (context, state, Widget? child) => UISwitch(
                      inactiveThumbColor: UIColor.backgroundInactive,
                      inactiveTrackColor: UIColor.backgroungSwitchUnactive,
                      scale: 0.7,
                      trackOutlineColor:
                          !isActiveNotification.value
                              ? WidgetStateProperty.all(
                                UIColor.backgroungSwitchUnactive,
                              )
                              : WidgetStateProperty.all(UIColor.tertiary),
                      trackOutlineWidth: WidgetStateProperty.all(
                        UI.sizes.trackOUtLined,
                      ),

                      value: state,
                      onChanged: (value) {
                        isActiveNotification.value = value;
                      },
                    ),
              ),
            ),
            ProfileSettingOptionWidget(
              title: 'Privacy Policy',
              descreption: 'Privacy Policy',
              imgUrl: Assets.icons.shieldDone,

              onTap: () {
                // log('pressed on FAQ button');
              },
            ),

            ProfileSettingOptionWidget(
              title: context.profileTranslation.option.faq,
              descreption: 'FAQ',
              imgUrl: Assets.icons.shieldDone,

              onTap: () {
                // log('pressed on FAQ button');
              },
            ),
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

              onTap: () {
                // log('pressed on FAQ butt/on');
              },
            ),
            ProfileSettingOptionWidget(
              title: context.profileTranslation.option.deleteAccount,
              descreption: 'Delete my account',
              imgUrl: Assets.icons.logOut,
              color: UIColor.backgroungAvaterRed,
              colorIcon: UIColor.iconsAvaterRed,

              onTap: () {
                // log('pressed on FAQ button');
              },
            ),
            // SettingOptionProfileWidget(),
          ],
        ),
      ),
    );
  }
}
