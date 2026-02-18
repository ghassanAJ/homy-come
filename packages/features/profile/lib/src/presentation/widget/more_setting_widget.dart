
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
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
        Container(
          padding: const EdgeInsets.fromLTRB(16, 17, 16, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: UIColor.background,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 44,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              ProfileSettingOptionWidget(
                title: context.profileTranslation.option.help,
                imgUrl: Assets.icons.notification,
                colorIcon: UIColor.grey,
                // descreption: 'FAQ',
                onTap: () {
                  // log('pressed on FAQ button');
                },
              ),
              ProfileSettingOptionWidget(
                title: context.profileTranslation.option.about,
                imgUrl: Assets.icons.heart,
                colorIcon: UIColor.grey,
                onTap: () {
                  // log('pressed on FAQ button');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
