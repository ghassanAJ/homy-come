import 'package:authentication/src/navigation/user_navigation_config.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class DashboardNavigationScaffold extends StatelessWidget {
  const DashboardNavigationScaffold({
    super.key,
    required this.navigationShell,
    required this.navigationItems,
  });

  final StatefulNavigationShell navigationShell;

  final List<NavigationItem> navigationItems;

  @override
  Widget build(BuildContext context) {
    final List<UiBottomNavigationItem> bottomBarItems = navigationItems
        .map(
          (item) => UiBottomNavigationItem(
            iconAsset: item.iconAsset,
            label: item.label,
          ),
        )
        .toList(growable: false);
    return Scaffold(
      backgroundColor: UIColor.background,
      body: navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: UiBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTabTapped(index),
        items: bottomBarItems,
      ),
    );
  }

  void _onTabTapped(int index) async {
    // Use goBranch to navigate while preserving state
    // initialLocation: true returns to the initial route of the branch
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
