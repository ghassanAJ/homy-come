import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:user/navigation/route.dart';
import 'package:util/util.dart';

class CategoriesScrollViewContent extends StatelessWidget {
  const CategoriesScrollViewContent({
    required this.searchController,
    required this.categories,
    required this.bottomSafeArea,
    super.key,
  });

  final TextEditingController searchController;
  final List<ServiceCategoryModel> categories;
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
            ..._buildCategoryItems(context, categories),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategoryItems(
    BuildContext context,
    List<ServiceCategoryModel> categories,
  ) {
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
          onTap:
              () => context.push(
                UserPaths.services,
                extra: {'id': category.documentId},
              ),
          title: category.info.name,
          subtitle: '${category.servicesCount} services',
          iconPath: category.info.image ?? '',
        ),
      );
    });
  }
}
