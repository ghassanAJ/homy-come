import 'package:design_system/design_system.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/repository/home_repository.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:user/features/home/presentation/widgets/shared/section_header_app_bar.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:util/util.dart';

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
    final categories = diContainer.get<HomeRepository>().getHomeContent().categories;
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: UIColor.background,
      body: Column(
        children: [
          SectionHeaderAppBar(title: context.loc<UserTranslation>().navigation.category),
          SizedBox(height: UI.spacing.xs),
          Divider(height: 1, thickness: 1, color: UIColor.neutral100),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                        padding: UI.padding.userSearchBottomSectionContent(
                      bottomInset: 110 + bottomSafeArea,
                    ).copyWith(top: UI.spacing.md),
                    child: Column(
                      children: [
                        CategoriesSearchField(controller: _searchController),
                        SizedBox(height: UI.spacing.lg),
                        for (int index = 0; index < categories.length; index++)
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              bottom: index == categories.length - 1 ? 0 : UI.spacing.lg,
                            ),
                            child: BaseCategoryItem.categoriesList(
                              title: categories[index].title,
                              subtitle: categories[index].description,
                              iconPath: categories[index].iconPath,
                            ),
                          ),
                      ],
                    ),
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
}
