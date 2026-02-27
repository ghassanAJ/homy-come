import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/widgets/home/service_offer_tile.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:user/features/home/presentation/widgets/shared/section_header_app_bar.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeContent = diContainer.get<HomeRepository>().getHomeContent();
    final categories = <String>[
      'All',
      ...homeContent.categories.map((item) => item.title),
    ];
    final services = _buildServicesList(homeContent.serviceOffers);
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: UIColor.background,
      body: UIEllipseBackground(
        child: Column(
          children: [
            const SectionHeaderAppBar(title: 'All Services'),
            SizedBox(height: UI.spacing.xs),
            Divider(height: 1, thickness: 1, color: UIColor.neutral100),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    padding: UI.padding
                        .userSearchBottomSectionContent(
                          bottomInset: 110 + bottomSafeArea,
                        )
                        .copyWith(top: UI.spacing.md),
                    children: [
                      CategoriesSearchField(controller: _searchController),
                      SizedBox(height: UI.spacing.lg),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder:
                              (_, index) => _CategoryChip(
                                title: categories[index],
                                isSelected:
                                    _selectedCategory == categories[index],
                                onTap:
                                    () => setState(
                                      () =>
                                          _selectedCategory = categories[index],
                                    ),
                              ),
                          separatorBuilder:
                              (_, __) => SizedBox(width: UI.spacing.sm),
                          itemCount: categories.length,
                        ),
                      ),
                      SizedBox(height: UI.spacing.md),
                      ...services.asMap().entries.map(
                        (entry) => Padding(
                          padding: EdgeInsetsDirectional.only(
                            bottom:
                                entry.key == services.length - 1
                                    ? 0
                                    : UI.spacing.lg,
                          ),
                          child: ServiceOfferTile(
                            imageUrl: entry.value.imageUrl,
                            title: entry.value.title,
                            price: entry.value.price,
                            oldPrice: entry.value.oldPrice,
                            reviewsCount: entry.value.reviewsCount,
                            ratingStars: entry.value.ratingStars,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                  PositionedDirectional(
                    start: UI.spacing.xl,
                    end: UI.spacing.xl,
                    bottom: UI.spacing.lg + bottomSafeArea,
                    child: UIButton.primary(label: 'Apply', expanded: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<HomeServiceOfferItem> _buildServicesList(
    List<HomeServiceOfferItem> data,
  ) {
    if (data.isEmpty) return [];
    return List<HomeServiceOfferItem>.generate(
      6,
      (index) => data[index % data.length],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: UI.padding.userSearchChipContent,
        decoration: BoxDecoration(
          color: UIColor.white,
          borderRadius: BorderRadius.circular(UI.radius.full),
          border: Border.all(
            color:
                isSelected
                    ? UIColor.neutral100.withValues(alpha: 0.3)
                    : UIColor.neutral100.withValues(alpha: 0.9),
            width: 1,
          ),
        ),
        child: UIText.bodyMedium(
          title,
          color: isSelected ? UIColor.primary : UIColor.grey,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}
