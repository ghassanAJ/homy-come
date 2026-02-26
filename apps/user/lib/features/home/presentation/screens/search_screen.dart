import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/repository/home_repository.dart';
import 'package:user/features/home/presentation/widgets/home/section_header.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';
import 'package:user/features/home/presentation/widgets/shared/section_header_app_bar.dart';
import 'package:user/features/home/presentation/widgets/search/popular_search_chips.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:util/util.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selectedPopular = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final popularSearch =
        diContainer.get<HomeRepository>().getSearchContent().popularSearch;
    if (popularSearch.isNotEmpty) {
      _selectedPopular = popularSearch.first;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchContent = diContainer.get<HomeRepository>().getSearchContent();
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: UIColor.background,
      body: Column(
        children: [
          SectionHeaderAppBar(title: context.loc<UserTranslation>().navigation.search),
          SizedBox(height: UI.spacing.xs),
          Divider(height: 1, thickness: 1, color: UIColor.neutral100),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: UI.padding.userSearchTopSectionContent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoriesSearchField(
                              controller: _searchController,
                            ),
                            SizedBox(height: UI.spacing.lg),
                            SectionTitle(title: 'Popular Search'),
                            SizedBox(height: UI.spacing.sm),
                            PopularSearchChips(
                              popularSearch: searchContent.popularSearch,
                              selectedPopular: _selectedPopular,
                              onSelected: (item) {
                                setState(() {
                                  _selectedPopular = item;
                                  _searchController.text = item;
                                });
                              },
                            ),
                            SizedBox(height: UI.spacing.lg),
                          ],
                        ),
                      ),
                      Divider(height: 1, thickness: 8, color: UIColor.neutral100),
                      Padding(
                        padding: UI.padding.userSearchBottomSectionContent(
                          endInset: 0,
                          bottomInset: 110 + bottomSafeArea,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(title: 'Top Services For You'),
                            SizedBox(height: UI.spacing.md),
                            _topServicesRow(searchContent.topServices),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PositionedDirectional(
                  start: UI.spacing.xl,
                  end: UI.spacing.xl,
                  bottom: UI.spacing.lg + bottomSafeArea,
                  child: UIButton.primary(
                    label: 'Apply',
                    expanded: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topServicesRow(List<HomeCategoryItem> topServices) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int index = 0; index < topServices.length; index++)
            Padding(
              padding: EdgeInsetsDirectional.only(
                end:
                    index == topServices.length - 1
                        ? 0
                        : UI.spacing.md + UI.spacing.xxs,
              ),
              child: BaseCategoryItem(
                title: topServices[index].title,
                subtitle: topServices[index].description,
                iconPath: topServices[index].iconPath,
                width: 68,
                iconContainerSize: 52,
                iconSize: 30,
                iconBorderRadius: BorderRadius.circular(UI.radius.xs + UI.radius.sm),
                itemSpacing: UI.spacing.xs,
                textSpacing: UI.spacing.xxs,
                titleFontSize: 12,
                titleFontWeight: FontWeight.w500,
                subtitleFontSize: 10,
                subtitleFontWeight: FontWeight.w400,
                titleMaxLines: 1,
                subtitleMaxLines: 1,
                textAlign: TextAlign.center,
                textCrossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
        ],
      ),
    );
  }
}
