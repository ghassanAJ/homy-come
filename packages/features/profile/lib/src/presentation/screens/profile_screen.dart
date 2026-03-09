import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/setting_profile_widget.dart';
import 'package:profile/src/presentation/widget/shared/header_card.dart';

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
          padding: UI.padding.driverProfileContent(topInset: topContentPadding),
          child: Column(
            children: [
              HeaderCard(),
              SizedBox(height: UI.spacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileSettingWidget(),
                  // SizedBox(height: UI.spacing.md),
                  // MoreSettingWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
