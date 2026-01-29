import 'package:homy_provider/navigation/route.dart';

/// Navigation item configuration for bottom bar
typedef NavigationItem = ({String path, String label, String iconAsset});

/// Configuration for provider app bottom navigation bar
class ProviderNavigationConfig {
  /// Navigation items for the bottom navigation bar
  static final List<NavigationItem> items = [
    (
      path: ProviderPaths.home,
      label: 'Home',
      iconAsset: 'assets/icons/home.svg',
    ),
    (
      path: ProviderPaths.services,
      label: 'Services',
      iconAsset: 'assets/icons/services.svg',
    ),
    (
      path: ProviderPaths.bookings,
      label: 'Bookings',
      iconAsset: 'assets/icons/bookings.svg',
    ),
    (
      path: ProviderPaths.profile,
      label: 'Profile',
      iconAsset: 'assets/icons/person.svg',
    ),
  ];
}
