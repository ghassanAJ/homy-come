import 'package:design_system/design_system.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class CategorySection<T> {
  final String id;
  final String title;
  final List<T> items;

  const CategorySection({
    required this.id,
    required this.title,
    required this.items,
  });
}

typedef CategoryItemBuilder<T> =
    Widget Function(BuildContext context, T item, int index);

typedef CategoryTabBuilder =
    Widget Function(BuildContext context, String title, bool isActive);

class CategoryTabSectionView<T> extends StatelessWidget {
  final List<CategorySection<T>> sections;

  final CategoryItemBuilder<T> itemBuilder;
  final Function(int index)? tabChanged;
  final CategoryTabBuilder? tabBuilder;

  final EdgeInsetsGeometry? padding;

  final double tabHeight;

  final Color? activeTabColor;
  final Color? inactiveTabColor;

  const CategoryTabSectionView({
    super.key,
    required this.sections,
    required this.itemBuilder,
    this.tabChanged,
    this.tabBuilder,
    this.padding,
    this.tabHeight = 48,
    this.activeTabColor,
    this.inactiveTabColor,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollableListTabScroller(
      itemCount: sections.length,
      headerContainerBuilder:
          (BuildContext context, Widget widget) => Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 120,

              child: widget,
            ),
          ),
      tabChanged: tabChanged,
      itemBuilder:
          (BuildContext context, int index) =>
              _buildSectionList(context, sections[index]),
      tabBuilder:
          (BuildContext context, int index, bool active) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _buildTab(context, sections[index].title, active),
          ),
    );
  }

  Widget _buildTab(BuildContext context, String title, bool active) {
    if (tabBuilder != null) {
      return tabBuilder!(context, title, false);
    }

    return UIText.bodyMedium(
      title,
      color: active ? UIColor.primary : UIColor.neutral500,
    );
  }

  Widget _buildSectionList(BuildContext context, CategorySection<T> section) {
    return ListView.separated(
      itemCount: section.items.length,

      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),

      separatorBuilder: (_, __) => const SizedBox(height: 8),

      itemBuilder: (context, index) {
        final item = section.items[index];

        return itemBuilder(context, item, index);
      },
    );
  }
}
