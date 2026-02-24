import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/data_user_profile.dart';
import 'package:profile/src/presentation/widget/more_setting_widget.dart';
import 'package:profile/src/presentation/widget/setting_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ValueNotifier<bool> isActiveNotification = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;
    return UIScaffold(
      appBarTitle: context.profileTranslation.profile.myProfile,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: topContentPadding,
            left: UI.spacing.lg,
            right: UI.spacing.lg,
            bottom: UI.spacing.xl,
          ),
          child: Column(
            children: [
              UserProfileInfoWidget(),
              SizedBox(height: UI.spacing.lg), //24

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileSettingWidget(
                    isActiveNotification: isActiveNotification,
                  ),
                  SizedBox(height: UI.spacing.md),
                  MoreSettingWidget(),
                ],
              ),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
