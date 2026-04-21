import 'package:design_system/gen/assets.gen.dart';
import 'package:driver/navigation/route.dart';

/// Navigation item configuration
typedef NavigationItem = ({String path, String label, String iconAsset});

/// Configuration for bottom navigation bar
class DriverNavigationConfig {
  /// Navigation items for the bottom navigation bar
  static final List<NavigationItem> items = [
    // (
    //   path: DriverPaths.myTeam,
    //   label: 'My Team',
    //   iconAsset: Assets.icons.myteam,
    // ),
    (path: DriverPaths.home, label: 'Home', iconAsset: Assets.icons.navHome),

    (
      path: DriverPaths.profile,
      label: 'Profile',
      iconAsset: Assets.icons.navProfile,
    ),
  ];
}
