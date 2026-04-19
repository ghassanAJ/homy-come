import 'package:design_system/gen/assets.gen.dart';
import 'package:homy_provider/navigation/route.dart';

/// Navigation item configuration for bottom bar
typedef NavigationItem = ({String path, String label, String iconAsset});

/// Configuration for provider app bottom navigation bar
class ProviderNavigationConfig {
  /// Navigation items for the bottom navigation bar
  static final List<NavigationItem> items = [
    (
      path: ProviderPaths.myWork,
      label: 'My Bookings',
      iconAsset: Assets.icons.navOrders,
    ),
    (
      path: ProviderPaths.homeProvider,
      label: 'Home',
      iconAsset: Assets.icons.navHome,
    ),
    (
      path: ProviderPaths.profile,
      label: 'Profile',
      iconAsset: Assets.icons.navProfile,
    ),
  ];
}
