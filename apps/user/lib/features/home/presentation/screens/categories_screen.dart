import 'dart:async';

import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/service_offer_tile.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_scroll_view_content.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController(
    text: '',
  );
  Timer? _debounce;
  final _debouncer = Debouncer();
  bool isiniilized = false;
  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _performSearch(value);
    });
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;

    context.read<HomeBloc>().add(LoadSearchContentEvent(query));
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty && isiniilized) {
        setState(() {});
      }
    });
    isiniilized = true;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return UIScaffold(
      resizeToAvoidBottomInset: true,
      appBarTitle: 'Search',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.12),
          ),
          SizedBox(height: UI.spacing.sm),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CategoriesSearchField(
              controller: _searchController,

              onCHhnged: (query) {
                _debouncer(() {
                  _performSearch(query);
                });
              },
            ),
          ),

          SizedBox(height: 16),

          if (_searchController.text.isEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: UIText.bodyMedium(
                'Popular Searches',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            PopularSearchesWIdget(
              onSelected: (value) {
                setState(() {
                  _searchController.text = value;
                });

                context.read<HomeBloc>().add(
                  LoadSearchContentEvent(_searchController.text),
                );
              },
            ),
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
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
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
          if (_searchController.text.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: UIText.bodyMedium(
                'Results for "${_searchController.text} "',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeBlocState>(
                builder: (context, state) {
                  if (state.categoryServices.isEmpty) {
                    return SizedBox.shrink();
                  }
                  if (state.searchContentLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return GradientFadeStack(
                    fadeBottom: true,
                    fadeRight: false,
                    width: 80,
                    child: ListView.separated(
                      itemCount: state.categoryServices.length,
                      separatorBuilder:
                          (context, index) => SizedBox(height: 12),
                      padding: EdgeInsetsDirectional.only(
                        start: 24,
                        end: 24,
                        top: 24,
                        bottom: 64,
                      ),
                      itemBuilder:
                          (context, index) => ServiceOfferTile(
                            servicePreviewResponseModel:
                                state.categoryServices[index],
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
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

class Debouncer {
  Debouncer({this.delay = const Duration(milliseconds: 500)});

  final Duration delay;
  Timer? _timer;

  void call(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() => _timer?.cancel();
}
