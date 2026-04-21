import 'package:booking/booking.dart';
import 'package:booking/src/presentation/screens/base_booking_step.dart';
import 'package:booking/src/presentation/screens/example_data.dart';
import 'package:booking/src/presentation/widgets/service_option_card.dart';
import 'package:booking/src/presentation/widgets/service_widgets/widgets.dart';
import 'package:booking/src/presentation/widgets/step_navigation_bar.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:user/features/home/presentation/screens/services_screen.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({required this.serviceId, super.key});

  final String serviceId;

  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen>
    with TickerProviderStateMixin {
  late AutoScrollController scrollController;
  late TabController tabController;

  bool isCollapsed = false;
  final double expandedHeight = 290.0;
  final double collapsedHeight = kToolbarHeight;

  final listViewKey = RectGetter.createGlobalKey();
  Map<int, dynamic> itemKeys = {};

  bool pauseRectGetterIndex = false;
  bool isTabControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    scrollController = AutoScrollController();
    tabController = TabController(length: 0, vsync: this);
    context.read<BookingWizardBloc>().add(
      LoadServiceDetails(serviceId: widget.serviceId),
    );
  }

  void _initializeTabController(int length) {
    if (isTabControllerInitialized || length == 0) return;
    tabController.dispose();
    tabController = TabController(length: length, vsync: this);
    isTabControllerInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: UIColor.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<BookingWizardBloc, BookingWizardState>(
        // buildWhen:
        //     (prev, curr) =>
        //         prev.serviceDetailsLoading != curr.serviceDetailsLoading ||
        //         prev.serviceDetails != curr.serviceDetails,
        builder: (context, state) {
          if (state.serviceDetailsLoading ||
              state.serviceDetails == null ||
              state.selectedAddOns.isEmpty) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StepNavigationBar(
              next: () {
                context.read<BookingWizardBloc>().add(const ProceedToStep1());
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder:
                        (_) => BlocProvider.value(
                          value: context.read<BookingWizardBloc>(),
                          child: const BaseBookingStep(), //TODO
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
      body: BlocConsumer<BookingWizardBloc, BookingWizardState>(
        listenWhen:
            (prev, curr) =>
                curr.currentStep == BookingWizardStep.hoursStep &&
                prev.currentStep != BookingWizardStep.hoursStep,
        listener: (context, state) {
          // Navigator.of(context).push(
          //   MaterialPageRoute<void>(
          //     builder:
          //         (_) => BlocProvider.value(
          //           value: context.read<BookingWizardBloc>(),
          //           child: const ServiceDetailsScreenStep1(),
          //         ),
          //   ),
          // );
        },
        // buildWhen:
        //     (prev, curr) =>
        //         curr.serviceDetailsLoading != prev.serviceDetailsLoading ||
        //         curr.serviceDetails != prev.serviceDetails ||
        //         curr.serviceDetailsError != prev.serviceDetailsError ||
        //         curr.selectedAddOnIds != prev.selectedAddOnIds,
        builder: (context, state) {
          if (state.serviceDetailsLoading) {
            return const ServiceDetailsScreenShimmar();
          }

          if (state.serviceDetailsError != null) {
            return Center(
              child: Text(state.serviceDetailsError?.message ?? ''),
            );
          }

          _initializeTabController(
            state.serviceDetails?.addonCategories
                    .where((c) => c.services.isNotEmpty)
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
                    slivers: [
                      buildAppBar(data),
                      buildBody(data, state),
                      SliverToBoxAdapter(child: SizedBox(height: 18)),
                    ],
                  ),
                ),
              )
              : const SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildAppBar(ServiceDetailsResponseModel data) {
    return ServiceDetailsAppBar(
      info: data.info,
      categories:
          data.addonCategories
              .where((category) => category.services.isNotEmpty)
              .toList(),
      scrollController: scrollController,
      expandedHeightappBar: expandedHeight,
      collapsedHeightappBar: collapsedHeight,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: animateAndScrollTo,
      rating: data.rating ?? 0,
      reviewsCount: data.reviewsCount ?? 0,
    );
  }

  SliverList buildBody(
    ServiceDetailsResponseModel data,
    BookingWizardState state,
  ) {
    final filteredCategories =
        data.addonCategories.where((c) => c.services.isNotEmpty).toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            buildCategoryItem(index, filteredCategories[index], state),
        childCount: filteredCategories.length,
      ),
    );
  }

  Widget buildCategoryItem(
    int index,
    AddOnCategoryModel category,
    BookingWizardState state,
  ) {
    itemKeys[index] = RectGetter.createGlobalKey();
    final categoryData = CategorySectionData<AddOnServiceModel>(
      title: category.info?.name ?? '',
      subtitle: category.info?.description ?? '',
      items: category.services,
    );
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: CategorySection<AddOnServiceModel>(
          category: categoryData,
          itemBuilder:
              (context, item, index) => AddOnCard(
                data: item,
                selected: state.selectedAddOns.contains(item),
                onAddButtonPressed: () {
                  context.read<BookingWizardBloc>().add(
                    ToggleAddOnFromServiceDetails(addOnId: item),
                  );
                },
              ),
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
        .then((_) => pauseRectGetterIndex = false);
  }
}
