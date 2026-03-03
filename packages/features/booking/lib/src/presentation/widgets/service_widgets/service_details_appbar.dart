import 'package:booking/booking.dart';
import 'package:booking/src/presentation/screens/example_data.dart';
import 'package:booking/src/presentation/widgets/service_widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ServiceDetailsAppBar extends SliverAppBar {
  final PageData data;
  final BuildContext context;
  final bool isCollapsed;
  final double expandedHeightappBar;
  final double collapsedHeightappBar;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;
  final String appBarTitle;

  const ServiceDetailsAppBar({
    super.key,
    required this.data,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeightappBar,
    required this.collapsedHeightappBar,
    required this.scrollController,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
    required this.appBarTitle,
  }) : super(elevation: 4.0, pinned: true, forceElevated: true);

  @override
  Widget? get leading {
    return Center(
      child: UIIconButton(
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          }
        },
        backgroundColor: backgroundColor,
        icon: Icon(Icons.arrow_back, color: UIColor.black),
      ),
    );
  }

  @override
  List<Widget>? get actions {
    return [
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 8.0),
        child: UIIconButton(
          backgroundColor: backgroundColor,
          onPressed: () {},
          icon: Icon(Icons.share_outlined, color: UIColor.black),
        ),
      ),
      // FIconButton(
      //   backgroundColor: backgroundColor,
      //   onPressed: () {},
      //   icon: Icon(Icons.favorite_outline),
      // ),
    ];
  }

  @override
  bool? get centerTitle => false;

  @override
  Widget? get title {
    return AnimatedOpacity(
      opacity: !isCollapsed ? 1 : 0,
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.bodyMedium(
            appBarTitle,
            color: UIColor.black,
            fontWeight: FontWeight.w600,
          ),
          UIText.caption(
            'Step 1 of 4',
            color: UIColor.textSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        color: UIColor.white,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: UIColor.babyBlue,
          labelColor: UIColor.babyBlue,
          // labelStyle: UI.text.bodySmall.copyWith(fontWeight: FontWeight.w700),
          unselectedLabelColor: UIColor.textSecondary,
          indicatorWeight: 3.0,
          tabs:
              data.categories.map((e) {
                return Tab(text: e.info?.name);
              }).toList(),
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (context, constraints) {
        final top = constraints.constrainHeight();
        final collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: HeaderInfoSection(data: data, context: context),
        );
      },
    );
  }

  @override
  double get expandedHeight => expandedHeightappBar;
  @override
  double get collapsedHeight => collapsedHeightappBar;
  @override
  Color? get backgroundColor => UIColor.white;

  @override
  Color? get surfaceTintColor => UIColor.white;
}
