import 'package:booking/booking.dart';
import 'package:booking/src/presentation/screens/example_data.dart';
import 'package:booking/src/presentation/widgets/service_option_card.dart';
import 'package:booking/src/presentation/widgets/service_widgets/widgets.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  late AutoScrollController scrollController;
  late TabController tabController;

  final double expandedHeight = 300.0;
  final PageData data = ExampleData.data;
  final double collapsedHeight = kToolbarHeight;

  final listViewKey = RectGetter.createGlobalKey();
  Map<int, dynamic> itemKeys = {};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  @override
  void initState() {
    tabController = TabController(length: data.categories.length, vsync: this);
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: UIColor.white,
      body: RectGetter(
        key: listViewKey,
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [buildAppBar(), buildBody()],
          ),
        ),
      ),
    );
  }

  SliverAppBar buildAppBar() {
    return ServiceDetailsAppBar(
      data: data,
      context: context,
      scrollController: scrollController,
      expandedHeightappBar: expandedHeight,
      collapsedHeightappBar: collapsedHeight,
      appBarTitle: data.title,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) => animateAndScrollTo(index),
    );
  }

  SliverList buildBody() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => buildCategoryItem(index),
        childCount: data.categories.length,
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    itemKeys[index] = RectGetter.createGlobalKey();
    CategorySectionData<AddOnServiceModel> category = CategorySectionData(
      title: data.categories[index].info?.name ?? '',
      subtitle: data.categories[index].info?.description ?? '',
      items: data.categories[index].services,
    );
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: CategorySection<AddOnServiceModel>(
          category: category,
          itemBuilder:
              (context, item, index) =>
                  AddOnCard(data: item, onAddButtonPressed: () {}),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(() => isCollapsed = value);
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = tabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex =
        visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else if (visibleItems.isNotEmpty) {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex) {
        tabController.animateTo(middleIndex);
      }
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }
}
