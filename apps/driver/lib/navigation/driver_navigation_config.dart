/// Navigation item configuration
typedef NavigationItem = ({String path, String label, String iconAsset});

/// Configuration for bottom navigation bar
class DriverNavigationConfig {
  /// Navigation items for the bottom navigation bar
  static final List<NavigationItem> items = [
    (
      path: DriverPaths.myTeam,
      label: 'My Team',
      iconAsset: 'assets/icons/search.svg',
    ),
    (path: DriverPaths.home, label: 'Home', iconAsset: 'assets/icons/home.svg'),

    (
      path: DriverPaths.profile,
      label: 'Profile',
      iconAsset: 'assets/icons/orders.svg',
    ),
  ];
}

class DriverPaths {
  DriverPaths._();

  static const String home = '/home';
  static const String myTeam = '/my-team';
  static const String profile = '/profile';
}
