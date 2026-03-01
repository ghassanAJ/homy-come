import 'package:design_system/design_system.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:util/util.dart';

class CategoriesScrollViewContent extends StatelessWidget {
  const CategoriesScrollViewContent({
    required this.searchController,
    required this.categories,
    required this.bottomSafeArea,
    super.key,
  });

  final TextEditingController searchController;
  final List<HomeCategoryItem> categories;
  final double bottomSafeArea;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: UI.padding
            .userSearchBottomSectionContent(bottomInset: 110 + bottomSafeArea)
            .copyWith(top: UI.spacing.md),
        child: Column(
          children: [
            CategoriesSearchField(controller: searchController),
            SizedBox(height: UI.spacing.lg),
            ..._buildCategoryItems(categories),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategoryItems(List<HomeCategoryItem> categories) {
    return ListWidgetBuilder.mapWithIsLast(categories, (
      category,
      _,
      isLastItem,
    ) {
      return Padding(
        padding: EdgeInsetsDirectional.only(
          bottom: isLastItem ? 0 : UI.spacing.lg,
        ),
        child: BaseCategoryItem.categoriesList(
          title: category.title,
          subtitle: category.description,
          iconPath: category.iconPath,
        ),
      );
    });
  }
}
