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
    return UIScaffold(
      automaticallyImplyLeading: false,
      appBarTitle: context.profileTranslation.profile.myProfile,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 0),
          // UI.padding.driverProfileContent(topInset: 19), //CHECK
          child: Column(
            children: [
              HeaderCard(),
              SizedBox(height: UI.spacing.sm),
              ProfileSettingWidget(),
              // UIText.bodySmall('More'),
              // ProfileSettingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
