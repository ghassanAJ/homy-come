import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:design_system/design_system.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/presentation/widgets/home/home_header.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';

class HomeScreenAppBar extends StatefulWidget {
  final bool isCollapsed;
  final double expandedHeightappBar;
  final double collapsedHeightappBar;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;
  final String appBarTitle;

  const HomeScreenAppBar({
    super.key,
    required this.isCollapsed,
    required this.expandedHeightappBar,
    required this.collapsedHeightappBar,
    required this.onCollapsed,
    required this.onTap,
    required this.appBarTitle,
  });

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  // 0.0 = fully expanded (HomeHeader visible)
  // 1.0 = fully collapsed (location + search visible)
  double _t = 0.0;

  void _updateProgress(BoxConstraints constraints, double topPadding) {
    final minH = widget.collapsedHeightappBar + topPadding;
    final maxH = widget.expandedHeightappBar + topPadding;
    final range = maxH - minH;
    if (range <= 0) return;

    final newT = ((maxH - constraints.maxHeight) / range).clamp(0.0, 1.0);
    if ((newT - _t).abs() < 0.005) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _t = newT);
      widget.onCollapsed(newT >= 0.99);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = diContainer.get<AppCubit>().state.user;
    final topPadding = MediaQuery.of(context).padding.top;

    // Phase 1 (t 0.0 → 0.5): HomeHeader fades out
    // Phase 2 (t 0.5 → 1.0): collapsed content fades in
    final headerOpacity = (1.0 - _t * 2.0).clamp(0.0, 1.0);
    final collapsedOpacity = ((_t - 0.5) * 2.0).clamp(0.0, 1.0);

    return SliverAppBar(
      elevation: 4.0,
      pinned: true,
      forceElevated: true,
      automaticallyImplyLeading: false,
      toolbarHeight: widget.collapsedHeightappBar,
      expandedHeight: widget.expandedHeightappBar,
      collapsedHeight: widget.collapsedHeightappBar,
      backgroundColor: UIColor.white,
      surfaceTintColor: UIColor.white,
      // No title — avoids reserved toolbar space fighting with flexibleSpace
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          _updateProgress(constraints, topPadding);

          return UIEllipseBackground(
            child: SafeArea(
              bottom: false,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // ── Expanded state: HomeHeader ──────────────────────────
                  Opacity(
                    opacity: headerOpacity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const HomeHeader(),
                    ),
                  ),

                  // ── Collapsed state: location row + search ──────────────
                  if (collapsedOpacity > 0)
                    Opacity(
                      opacity: collapsedOpacity,
                      child: Transform.translate(
                        offset: Offset(0, 8.0 * (1.0 - collapsedOpacity)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: UI.spacing.md,
                            vertical: UI.spacing.xs,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  UISvg(Assets.icons.location, size: 16),
                                  SizedBox(width: UI.spacing.xxs),
                                  Flexible(
                                    child: UIText.bodySmall(
                                      user?.address?.toString() ??
                                          'no address selected',
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 16,
                                      color: UIColor.neutral400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: UI.spacing.xs),
                              CategoriesSearchField(
                                withIcon: false,
                                placeholder: 'search for a srevice',
                                controller: TextEditingController(),
                                readOnly: true,
                                // onTap:
                                //     () => diContainer.get<CustomRouter>().push(
                                //       UserPaths.services,
                                //     ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
