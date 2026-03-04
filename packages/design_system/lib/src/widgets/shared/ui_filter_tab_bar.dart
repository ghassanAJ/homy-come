import '../../../design_system.dart';
import 'filter_tab_widget.dart';

class UIFilterTabBar extends StatefulWidget {
  const UIFilterTabBar({
    super.key,
    required this.tabs,
    this.tabController,
    required this.package,
  });
  final List<FilterTabContent> tabs;
  final TabController? tabController;
  final String package;
  @override
  State<UIFilterTabBar> createState() => _UIFilterTabBarState();
}

class _UIFilterTabBarState extends State<UIFilterTabBar> {
  late TabController tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    tabController = widget.tabController ?? DefaultTabController.of(context);
    tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    tabController.removeListener(_handleTabChange);
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: TabBar(
        // splashBorderRadius: BorderRadius.circular(99),
        controller: tabController,
        dividerColor: Colors.transparent,
        // indicatorColor: UIColor.primary,
        // indicatorWeight: 2,
        indicator: const BoxDecoration(),
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding:  EdgeInsets.symmetric( horizontal: UI.spacing.xs,vertical: 0),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        tabs: widget.tabs
            .map(
              (tab) => FilterTabWidget(
                isSelected: tabController.index == widget.tabs.indexOf(tab),
                text: tab.text,
                iconPath: tab.iconPath,
                package: widget.package,
              ),
            )
            .toList(),
      ),
    );
  }
}

class FilterTabContent {
  final String text;
  final String iconPath;

  FilterTabContent({required this.text, required this.iconPath});
}
