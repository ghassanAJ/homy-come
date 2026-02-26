import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/user_navigation_config.dart';

class DashboardNavigationScaffold extends StatelessWidget {
  const DashboardNavigationScaffold({
    super.key,
    required this.navigationShell,
    required this.navigationItems,
    required this.branchPaths,
  });

  final StatefulNavigationShell navigationShell;

  final List<NavigationItem> navigationItems;
  final List<String> branchPaths;

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
    final currentPath = GoRouterState.of(context).matchedLocation;
    final currentItemIndex = _itemIndexForPath(currentPath);
    return Scaffold(
      backgroundColor: UIColor.background,
      body: navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: UiBottomNavigationBar(
        currentIndex: currentItemIndex,
        onTap: (index) => _onTabTapped(index),
        items: bottomBarItems,
      ),
    );
  }

  int _itemIndexForPath(String path) {
    final index = navigationItems.indexWhere(
      (item) => path == item.path || path.startsWith('${item.path}/'),
    );
    if (index != -1) return index;

    final currentBranchPath =
        (navigationShell.currentIndex >= 0 &&
                navigationShell.currentIndex < branchPaths.length)
            ? branchPaths[navigationShell.currentIndex]
            : null;
    if (currentBranchPath == null) return 0;

    final fallback = navigationItems.indexWhere(
      (item) => item.path == currentBranchPath,
    );
    return fallback == -1 ? 0 : fallback;
  }

  int _branchIndexForItemIndex(int itemIndex) {
    if (itemIndex < 0 || itemIndex >= navigationItems.length) return 0;
    final itemPath = navigationItems[itemIndex].path;
    final branchIndex = branchPaths.indexOf(itemPath);
    return branchIndex == -1 ? itemIndex : branchIndex;
  }

  void _onTabTapped(int index) {
    final branchIndex = _branchIndexForItemIndex(index);
    // Use goBranch to navigate while preserving state
    // initialLocation: true returns to the initial route of the branch
    navigationShell.goBranch(
      branchIndex,
      initialLocation: branchIndex == navigationShell.currentIndex,
    );
  }
}
