import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/setting_option_profile_widget.dart';

class MoreSettingWidget extends StatelessWidget {
  const MoreSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.h5(context.profileTranslation.profile.more),
        SizedBox(height: UI.spacing.lg),
        UICardContainer(
          padding: UI.padding.profileOptionsCardContent,
          width: double.infinity,
          child: Column(
            children: [
              ProfileSettingOptionWidget(
                title: context.profileTranslation.option.help,
                imgUrl: Assets.icons.notification,
                onTap: ProfileInternalRouter.of(context).toTermsAndCondition,
              ),
              ProfileSettingOptionWidget(
                title: context.profileTranslation.option.about,
                imgUrl: Assets.icons.heart,
                onTap: ProfileInternalRouter.of(context).toAboutApp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
