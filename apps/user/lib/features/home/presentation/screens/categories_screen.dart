import 'package:design_system/design_system.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_scroll_view_content.dart';
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
    final categories =
        diContainer.get<HomeRepository>().getHomeContent().categories;
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

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
      body: UIEllipseBackground(
        child: Column(
          children: [
            SectionHeaderAppBar(
              title: context.loc<UserTranslation>().navigation.category,
            ),
            SizedBox(height: UI.spacing.xs),
            Divider(height: 1, thickness: 1, color: UIColor.neutral100),
            Expanded(
              child: CategoriesScrollViewContent(
                searchController: _searchController,
                categories: categories,
                bottomSafeArea: bottomSafeArea,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
