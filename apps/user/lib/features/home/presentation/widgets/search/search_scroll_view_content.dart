import 'package:design_system/design_system.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/entities/search_content.dart';
import 'package:user/features/home/presentation/widgets/home/section_header.dart';
import 'package:user/features/home/presentation/widgets/search/popular_search_chips.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:util/util.dart';

class SearchScrollViewContent extends StatelessWidget {
  const SearchScrollViewContent({
    required this.searchController,
    required this.searchContent,
    required this.selectedPopular,
    required this.bottomSafeArea,
    required this.onSelectedPopular,
    super.key,
  });

  final TextEditingController searchController;
  final SearchContent searchContent;
  final String selectedPopular;
  final double bottomSafeArea;
  final ValueChanged<String> onSelectedPopular;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UI.padding.userSearchTopSectionContent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoriesSearchField(controller: searchController),
                SizedBox(height: UI.spacing.lg),
                SectionTitle(title: 'Popular Search'),
                SizedBox(height: UI.spacing.sm),
                PopularSearchChips(
                  popularSearch: searchContent.popularSearch,
                  selectedPopular: selectedPopular,
                  onSelected: onSelectedPopular,
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
    );
  }

  Widget _topServicesRow(List<HomeCategoryItem> topServices) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: _buildTopServiceItems(topServices)),
    );
  }

  List<Widget> _buildTopServiceItems(List<HomeCategoryItem> topServices) {
    return ListWidgetBuilder.mapWithIsLast(topServices, (item, _, isLastItem) {
      return Padding(
        padding: EdgeInsetsDirectional.only(
          end: isLastItem ? 0 : UI.spacing.md + UI.spacing.xxs,
        ),
        child: BaseCategoryItem(
          title: item.title,
          subtitle: item.description,
          iconPath: item.iconPath,
          width: 68,
        ),
      );
    });
  }
}
