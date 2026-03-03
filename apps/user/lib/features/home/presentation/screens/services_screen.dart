import 'package:design_system/design_system.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/mappers/home_response_mapper.dart';
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
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;
    final homeFuture = diContainer.get<HomeRepository>().getHomeContent();

    return Scaffold(
      backgroundColor: UIColor.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: UI.spacing.xl),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: UIButton.primary(label: 'Apply', expanded: true),
        ),
      ),
      body: FutureBuilder(
        future: homeFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: UIColor.error),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
          final result = snapshot.data!;
          return result.fold(
            (homeResponse) {
              final homeContent = mapHomeResponseToContent(homeResponse);
              final categories = <String>[
                'All',
                ...homeContent.categories.map((item) => item.title),
              ];
              final services = _buildServicesList(homeContent.serviceOffers);
              return UIEllipseBackground(
                child: Column(
                  children: [
                    const SectionHeaderAppBar(title: 'All Services'),
                    SizedBox(height: UI.spacing.xs),
                    Divider(height: 1, thickness: 1, color: UIColor.neutral100),
                    Expanded(
                      child: ListView(
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
                                  (_, index) => UIChipWidget(
                                    title: categories[index],
                                    isSelected:
                                        _selectedCategory == categories[index],
                                    onTap:
                                        () => setState(
                                          () =>
                                              _selectedCategory =
                                                  categories[index],
                                        ),
                                  ),
                              separatorBuilder:
                                  (_, index) => SizedBox(width: UI.spacing.sm),
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
                    ),
                  ],
                ),
              );
            },
            (error) => Center(
              child: Text(
                error.message,
                style: TextStyle(color: UIColor.error),
              ),
            ),
          );
        },
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
