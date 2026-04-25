import 'package:design_system/gen/assets.gen.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:user/navigation/route.dart';

/// Navigation item configuration
typedef NavigationItem = ({String path, String label, String iconAsset});

/// Configuration for bottom navigation bar
class UserNavigationConfig {
  /// Navigation items for the bottom navigation bar
  static List<NavigationItem> items(UserTranslation tr) => [
    (
      path: UserPaths.home,
      label: tr.navigation.home,
      iconAsset: Assets.icons.navHome,
    ),
    (
      path: UserPaths.orders,
      label: tr.navigation.orders,
      iconAsset: Assets.icons.calendar,
    ),
    // (
    //   path: UserPaths.category,
    //   label: tr.navigation.category,
    //   iconAsset: Assets.icons.navCategory,
    // ),
    (
      path: UserPaths.profile,
      label: tr.navigation.profile,
      iconAsset: Assets.icons.navProfile,
    ),
  ];
}
