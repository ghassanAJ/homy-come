import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/driver/driver_profile_performance_card.dart';
import 'package:profile/src/presentation/widget/shared/header_card.dart';
import 'package:profile/src/presentation/widget/shared/settings_row.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      appBar: UIAppBar(
        automaticallyImplyLeading: false,
        title: context.profileTranslation.profile.myProfile,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UI.padding.driverProfileContent(topInset: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderCard(),
                  SizedBox(height: UI.spacing.sm),
                  PerformanceCard(),
                  SizedBox(height: UI.spacing.sm),
                  UICardContainer(
                    width: double.infinity,
                    padding: UI.padding.driverProfileSettingsCardContent,
                    child: SettingsRow(
                      onTap:
                          ProfileInternalRouter.of(
                            context,
                          ).toDriverProfileSettings,
                      title: context.profileTranslation.driverProfile.settings,
                      titleBuilder:
                          (title, color) => UIText.bodySmall(
                            title,
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                      showDivider: false,
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
