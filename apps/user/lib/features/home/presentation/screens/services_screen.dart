import 'dart:developer';

import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/service_offer_tile.dart';
import 'package:user/navigation/route.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({required this.id, super.key, required this.title});
  final String id;
  final String title;
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
      LoadCategoryServicesEvent(widget.id.toString()),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return UIScaffold(
      backgroundColor: UIColor.background,
      appBarTitle: widget.title,
      body: Column(
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.12),
          ),
          // SizedBox(height: UI.spacing.sm),
          SizedBox(height: UI.spacing.md),

          Expanded(
            child: BlocBuilder<HomeBloc, HomeBlocState>(
              builder: (context, state) {
                if (state.serviceDetailsLoading) {
                  return const ServicesScreenShimmar();
                }
                if (state.error != null) {
                  return Center(
                    child: Text(
                      state.error?.message ?? '',
                      style: TextStyle(color: UIColor.error),
                    ),
                  );
                }

                final displayedPreviews = state.categoryServices;
                log('displayedPreviews: ${displayedPreviews.length}');
                return GradientFadeStack(
                  fadeRight: false,
                  fadeBottom: true,
                  width: 80,
                  child: GridView.builder(
                    padding: UI.padding
                        .userSearchBottomSectionContent(
                          bottomInset: 110 + bottomSafeArea,
                        )
                        .copyWith(top: UI.spacing.md),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: displayedPreviews.length,
                    itemBuilder:
                        (BuildContext context, int index) => GestureDetector(
                          onTap:
                              () => context.push(
                                UserPaths.serviceDetails,
                                extra: {
                                  'id': displayedPreviews[index].documentId,
                                },
                              ),

                          child: ServiceOfferTile(
                            servicePreviewResponseModel:
                                displayedPreviews[index],
                            width: double.infinity,
                          ),
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceDetailsScreenShimmar extends StatelessWidget {
  const ServiceDetailsScreenShimmar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            // ── App bar skeleton ─────────────────────────────────────────────
            SliverToBoxAdapter(child: _ShimmerAppBar()),

            // ── Tab bar skeleton ─────────────────────────────────────────────
            SliverToBoxAdapter(child: _ShimmerTabBar()),

            // ── Category + card skeletons ────────────────────────────────────
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) => _ShimmerCategorySection(),
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── App-bar hero + info skeleton ─────────────────────────────────────────────

class _ShimmerAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero image
        ShimmerBox(width: double.infinity, height: 200, radius: 0),

        // Info section (mirrors HeaderInfoSection below the image)
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UI.spacing.sm,
            vertical: UI.spacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "Step 1 of 4" caption
              ShimmerBox(width: 80, height: 12, radius: 6),
              SizedBox(height: UI.spacing.xs),
              // Service title
              ShimmerBox(width: 200, height: 20, radius: 8),
              SizedBox(height: UI.spacing.xs),
              // Rating row
              Row(
                children: [
                  ShimmerBox(
                    width: 16,
                    height: 16,
                    radius: 8,
                    shape: BoxShape.circle,
                  ),
                  SizedBox(width: UI.spacing.xxs),
                  ShimmerBox(width: 28, height: 12, radius: 6),
                  SizedBox(width: UI.spacing.xxs),
                  ShimmerBox(width: 44, height: 12, radius: 6),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Horizontal tab-bar skeleton ──────────────────────────────────────────────

class _ShimmerTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: UIColor.white,
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.md,
        vertical: UI.spacing.xs,
      ),
      child: Row(
        children: [
          for (final w in [90.0, 110.0, 80.0, 100.0, 70.0]) ...[
            Expanded(
              child: ShimmerBox(width: double.infinity, height: 28, radius: 8),
            ),
            SizedBox(width: UI.spacing.xs),
          ],
        ],
      ),
    );
  }
}

// ── Category section skeleton (header + 3 add-on cards) ──────────────────────

class _ShimmerCategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: UI.spacing.md),
      color: UIColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header band — mirrors CategorySection._sectionTitle
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: UI.spacing.md,
              vertical: UI.spacing.xs,
            ),
            color: UIColor.bordarCard,
            child: ShimmerBox(width: 140, height: 16, radius: 6),
          ),
          SizedBox(height: UI.spacing.md),

          // 3 card skeletons per section
          for (var i = 0; i < 3; i++) _ShimmerAddOnCard(),
        ],
      ),
    );
  }
}

// ── Single add-on card skeleton — mirrors AddOnCard layout ───────────────────

class _ShimmerAddOnCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UI.spacing.sm),
      decoration: BoxDecoration(
        color: UIColor.background,
        border: Border(bottom: BorderSide(color: UIColor.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ShimmerBox(width: 74, height: 74, radius: UI.radius.sm),
          SizedBox(width: UI.spacing.sm),

          // Text column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(width: double.infinity, height: 14, radius: 6),
                SizedBox(height: UI.spacing.xxs),
                ShimmerBox(width: 60, height: 11, radius: 5),
                SizedBox(height: UI.spacing.xxs),
                ShimmerBox(width: double.infinity, height: 11, radius: 5),
                SizedBox(height: UI.spacing.xxs),
                ShimmerBox(width: 120, height: 11, radius: 5),
                SizedBox(height: UI.spacing.xxs),
                // Price row
                Row(
                  children: [
                    ShimmerBox(width: 48, height: 13, radius: 5),
                    SizedBox(width: UI.spacing.xxs),
                    ShimmerBox(width: 48, height: 13, radius: 5),
                  ],
                ),
              ],
            ),
          ),

          // "Add" button
          SizedBox(width: UI.spacing.sm),
          ShimmerBox(width: 52, height: 32, radius: UI.radius.lg),
        ],
      ),
    );
  }
}

class ServicesScreenShimmar extends StatelessWidget {
  const ServicesScreenShimmar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UI.padding.allMd,
      child: ListView(
        children: [
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
        ],
      ),
    );
  }
}
