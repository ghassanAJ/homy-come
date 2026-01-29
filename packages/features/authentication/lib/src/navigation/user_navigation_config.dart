import 'package:user/navigation/route.dart';

/// Navigation item configuration
typedef NavigationItem = ({String path, String label, String iconAsset});

/// Configuration for bottom navigation bar
class UserNavigationConfig {
  /// Navigation items for the bottom navigation bar
  static final List<NavigationItem> items = [
    (
      path: UserPaths.search,
      label: 'Search',
      iconAsset: 'assets/icons/search.svg',
    ),
    (
      path: UserPaths.orders,
      label: 'Orders',
      iconAsset: 'assets/icons/orders.svg',
    ),
    (path: UserPaths.home, label: 'Home', iconAsset: 'assets/icons/home.svg'),
    (
      path: UserPaths.category,
      label: 'Category',
      iconAsset: 'assets/icons/category.svg',
    ),
    (
      path: UserPaths.profile,
      label: 'Profile',
      iconAsset: 'assets/icons/person.svg',
    ),
  ];
}
