import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_scroll_view_content.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return UIScaffold(
      appBarTitle: 'Search',
      withBackButton: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CategoriesSearchField(controller: _searchController),
          ),

          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: UIText.bodyMedium(
              'Popular Searches',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),

          PopularSearchesWIdget(onSelected: (value) {}),
          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: UIText.bodyMedium(
              'Top services for you',
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: BlocSelector<
              HomeBloc,
              HomeBlocState,
              List<ServiceCategoryModel>
            >(
              selector: (state) => state.categories,
              builder: (context, state) {
                if (state.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CategoriesScrollViewContent(
                  searchController: _searchController,
                  categories: [...state],
                  bottomSafeArea: bottomSafeArea,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PopularSearchesWIdget extends StatefulWidget {
  const PopularSearchesWIdget({super.key, required this.onSelected});
  final ValueChanged<String> onSelected;

  @override
  State<PopularSearchesWIdget> createState() => _PopularSearchesWIdgetState();
}

class _PopularSearchesWIdgetState extends State<PopularSearchesWIdget> {
  String selectedSearch = '';
  @override
  Widget build(BuildContext context) {
    final List<String> searches = [
      'Home Cleaning',
      'IV Therapy at Home',
      'Men\'s Spa',
      'Handyman & Maintenance',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        children: List.generate(
          searches.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
            child: UIChipWidget(
              selectedBackgroundColor: UIColor.babyPink,
              borderColor: UIColor.pink,
              title: searches[index],
              isSelected: selectedSearch == searches[index],
              onTap: () {
                setState(() {
                  selectedSearch = searches[index];
                });
                widget.onSelected(selectedSearch);
              },
            ),
          ),
        ),
      ),
    );
  }
}
