import 'package:booking/booking.dart';
import 'package:booking/src/presentation/screens/example_data.dart';
import 'package:booking/src/presentation/widgets/service_option_card.dart';
import 'package:booking/src/presentation/widgets/service_widgets/widgets.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/screens/services_screen.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({required this.serviceId, super.key});
  final int serviceId;
  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AutoScrollController scrollController;
  late TabController tabController;

  bool isCollapsed = false;
  final double expandedHeight = 300.0;
  final double collapsedHeight = kToolbarHeight;

  // final PageData data = ExampleData.data;

  final listViewKey = RectGetter.createGlobalKey();
  Map<int, dynamic> itemKeys = {};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  bool isTabControllerInitialized = false;

  @override
  void initState() {
    scrollController = AutoScrollController();
    context.read<HomeBloc>().add(
      LoadServiceDetailsEvent(
        GetServiceDetailsRequestModel(serviceId: widget.serviceId.toString()),
      ),
    );
    super.initState();
  }

  void _initializeTabController(int length) {
    if (isTabControllerInitialized) return;
    tabController = TabController(length: length, vsync: this);
    isTabControllerInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: UIColor.white,
      body: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (context, state) {
          if (state.status == HomeBlocStatus.loadingServiceDetails) {
            return const ServiceDetailsScreenShimmar();
          }
          if (state.error != null) {
            return Center(child: Text(state.error?.message ?? ''));
          }

          _initializeTabController(
            state.serviceDetails?.categories
                    .where((category) => category.services.isNotEmpty)
                    .length ??
                0,
          );

          final data = state.serviceDetails;
          return data != null
              ? RectGetter(
                key: listViewKey,
                child: NotificationListener<ScrollNotification>(
                  onNotification: onScrollNotification,
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [buildAppBar(data), buildBody(data)],
                  ),
                ),
              )
              : const SizedBox.shrink();
        },
      ),
    );
  }

  SliverAppBar buildAppBar(ServiceDetailsResponseModel data) {
    return ServiceDetailsAppBar(
      info: data.info,
      categories:
          data.categories
              .where((category) => category.services.isNotEmpty)
              .toList(),
      context: context,
      scrollController: scrollController,
      expandedHeightappBar: expandedHeight,
      collapsedHeightappBar: collapsedHeight,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) => animateAndScrollTo(index),
    );
  }

  SliverList buildBody(ServiceDetailsResponseModel data1) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => buildCategoryItem(index, data1.categories[index]),
        childCount:
            data1.categories
                .where((category) => category.services.isNotEmpty)
                .length,
      ),
    );
  }

  Widget buildCategoryItem(int index, AddOnCategoryModel category1) {
    itemKeys[index] = RectGetter.createGlobalKey();
    CategorySectionData<AddOnServiceModel> category = CategorySectionData(
      title: category1.info?.name ?? '',
      subtitle: category1.info?.description ?? '',
      items: category1.services,
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



// class UserHomeAppBar extends StatelessWidget {
//   const UserHomeAppBar({
//     super.key,
//     required this.constraints,
//     required this.scrollController,
//   });

//   final BoxConstraints constraints;
//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context) {
//     final currentUser = diContainer.get<AppCubit>().state.user;
//     final tabBarHeight = _getTabBarHeight(context);

//     return SliverAppBar(
//       backgroundColor: UIColor.white,
//       elevation: 0,
//       clipBehavior: Clip.none,
//       floating: false,
//       snap: false,
//       pinned: true,
//       expandedHeight: UI.sizes.appBarHeight, // AppBar height + tab bar height
//       // title: AnimatedBuilder(
//       //   animation: scrollController,
//       //   builder: (context, child) {
//       //     // Calculate collapse ratio (0 = expanded, 1 = collapsed)
//       //     final scrollOffset =
//       //         scrollController.hasClients ? scrollController.offset : 0.0;
//       //     final collapseRatio = (scrollOffset / tabBarHeight).clamp(0.0, 1.0);

//       //     return _buildAnimatedCollapsedTitle(
//       //       context,
//       //       currentUser,
//       //       collapseRatio,
//       //     );
//       //   },
//       // ),
//       flexibleSpace: FlexibleSpaceBar(
//         background: SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               // const SizedBox(height: 56), // AppBar height
//               HomeHeader(),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     Padding(
//               //       padding: const EdgeInsetsDirectional.only(start: 32),
//               //       child: Align(
//               //         alignment: Alignment.centerLeft,
//               //         child: UIText.h3(
//               //           "Hi ${currentUser?.firstName ?? ''}",
//               //           color: UIColor.primaryDark,
//               //         ),
//               //       ),
//               //     ),
//               //     Padding(
//               //       padding: const EdgeInsetsDirectional.only(end: 16),
//               //       child: IconButton(
//               //         padding: EdgeInsets.zero,
//               //         icon: UISvg(Assets.icons.notification),
//               //         onPressed: () {},
//               //       ),
//               //     ),
//               //     //  const SizedBox(width: 12),
//               //   ],
//               // ),
//               // Expanded(child: ChildrenTabBar()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  

//   double _getTabBarHeight(BuildContext context) {
//     return constraints.maxWidth > 500
//         ? MediaQuery.sizeOf(context).height * 0.35
//         : MediaQuery.sizeOf(context).height * 0.08;
//   }
// }