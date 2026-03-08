import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/navigation/router.dart';
import 'package:profile/src/presentation/widget/shared/header_card.dart';
import 'package:profile/src/presentation/widget/driver/driver_profile_performance_card.dart';
import 'package:profile/src/presentation/widget/shared/settings_row.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        title: context.profileTranslation.profile.myProfile,
        // leading: GestureDetector(
        //   onTap: () {
        //     if (context.canPop()) context.pop();
        //   },
        //   child: const BackButtonAppBar(),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UI.padding.driverProfileContent(
                topInset: topContentPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderCard(),
                  SizedBox(height: UI.spacing.sm),
                  PerformanceCard(),
                  SizedBox(height: UI.spacing.sm),
                  Container(
                    width: double.infinity,
                    padding: UI.padding.driverProfileSettingsCardContent,
                    decoration: BoxDecoration(
                      color: UIColor.background,
                      borderRadius: BorderRadius.circular(UI.radius.md),
                      boxShadow: UI.shadows.cardMd,
                    ),
                    child: SettingsRow(
                      onTap:
                          () =>
                              context.push(ProfilePaths.driverProfileSettings),
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
                  SizedBox(height: UI.spacing.xl),
                ],
              ),
            ),

            SizedBox(height: UI.sizes.bottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }

  // Future<void> _openSettingsScreen() async {
  //   await context.push(ProfilePaths.driverProfileSettings);
  // }
}
