import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ServiceDetailsAppBar extends StatefulWidget {
  const ServiceDetailsAppBar({
    super.key,
    required this.info,
    required this.categories,
    required this.isCollapsed,
    required this.expandedHeightappBar,
    required this.collapsedHeightappBar,
    required this.scrollController,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
    this.rating = 0,
    this.reviewsCount = 0,
  });

  final List<AddOnCategoryModel> categories;
  final InfoModel info;
  final bool isCollapsed;
  final double expandedHeightappBar;
  final double collapsedHeightappBar;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;
  final int rating;
  final int reviewsCount;

  @override
  State<ServiceDetailsAppBar> createState() => _ServiceDetailsAppBarState();
}

class _ServiceDetailsAppBarState extends State<ServiceDetailsAppBar> {
  // How far the flexible space needs to scroll before it's fully collapsed.
  double get _scrollRange =>
      widget.expandedHeightappBar -
      MediaQuery.of(context).viewPadding.top -
      kToolbarHeight -
      48; // tab bar height

  // 0.0 = fully expanded, 1.0 = fully collapsed
  double get _collapseRatio {
    if (!widget.scrollController.hasClients) return 0.0;
    return (widget.scrollController.offset / _scrollRange).clamp(0.0, 1.0);
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(ServiceDetailsAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController.removeListener(_onScroll);
      widget.scrollController.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    setState(() {});
    final collapsedHeight =
        MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
    final top =
        widget.scrollController.hasClients
            ? widget.expandedHeightappBar - widget.scrollController.offset
            : widget.expandedHeightappBar;
    widget.onCollapsed(top <= collapsedHeight);
  }

  @override
  Widget build(BuildContext context) {
    final ratio = _collapseRatio;

    // Icon buttons: transparent background → white background
    final iconBgOpacity = ratio > 0.5 ? 0.0 : 1.0;
    final iconBgColor = UIColor.white.withOpacity(iconBgOpacity);

    // Title: fades in as we collapse
    final titleOpacity = ratio;

    // Hero image: fades out as we collapse
    final heroOpacity = (1.0 - ratio).clamp(0.0, 1.0);

    // Info text section below hero: slides up + fades out
    final infoOpacity = (1.0 - ratio * 2).clamp(0.0, 1.0);

    return SliverAppBar(
      elevation: 4.0,
      pinned: true,
      forceElevated: true,
      backgroundColor: UIColor.white,
      surfaceTintColor: UIColor.white,
      expandedHeight: widget.expandedHeightappBar,
      collapsedHeight: widget.collapsedHeightappBar,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Center(
          child: UIIconButton(
            onPressed: () {
              if (context.canPop()) context.pop();
            },
            backgroundColor: iconBgColor,
            icon: UISvg(Assets.icons.arrowLeft, size: 30),
          ),
        ),
      ),
      actions: [
        // Padding(
        //   padding: const EdgeInsetsDirectional.only(end: 8.0),
        //   child: UIIconButton(
        //     backgroundColor: iconBgColor,
        //     onPressed: () {

        //     },
        //     icon: Icon(Icons.share_outlined, color: UIColor.black),
        //   ),
        // ),
      ],
      centerTitle: false,
      title: Opacity(
        opacity: titleOpacity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.bodyMedium(
              widget.info.name,
              color: UIColor.black,
              fontWeight: FontWeight.w600,
            ),
            UIText.caption(
              'Step 1 of 3',
              color: UIColor.textSecondary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          color: UIColor.white,
          child: TabBar(
            isScrollable: true,
            controller: widget.tabController,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            indicatorColor: UIColor.babyBlue,
            labelColor: UIColor.babyBlue,
            unselectedLabelColor: UIColor.textSecondary,
            indicatorWeight: 3.0,
            tabs:
                widget.categories.map((e) => Tab(text: e.info?.name)).toList(),
            onTap: widget.onTap,
          ),
        ),
      ),
      flexibleSpace: UIEllipseBackground(
        child: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero image with fade-out
              Opacity(
                opacity: heroOpacity,
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      UINetworkImage(
                        // placeholder: Assets.images.onboarding.path,
                        imageUrl: widget.info.image ?? '',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(color: UIColor.black.withOpacity(0.5)),
                    ],
                  ),
                ),
              ),

              // Info section with fade-out + slide up
              Opacity(
                opacity: infoOpacity,
                child: Transform.translate(
                  offset: Offset(0, -ratio * 24),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.0),
                        UIText.caption(
                          'Step 1 of 3',
                          color: UIColor.textSecondary,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            UIText.h2(
                              widget.info.name,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(width: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                // const SizedBox(width: 4.0),
                                UIText.bodySmall(widget.rating.toString()),
                                const SizedBox(width: 4.0),
                                UIText.bodySmall(
                                  '(${widget.reviewsCount} Reviews)',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
