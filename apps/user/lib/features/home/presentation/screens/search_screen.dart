import 'package:design_system/design_system.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/widgets/search/search_scroll_view_content.dart';
import 'package:user/features/home/presentation/widgets/shared/section_header_app_bar.dart';
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
              title: context.loc<UserTranslation>().navigation.search,
            ),
            SizedBox(height: UI.spacing.xs),
            Divider(height: 1, thickness: 1, color: UIColor.neutral100),
            Expanded(
              child: SearchScrollViewContent(
                searchController: _searchController,
                searchContent: searchContent,
                selectedPopular: _selectedPopular,
                bottomSafeArea: bottomSafeArea,
                onSelectedPopular: (item) {
                  setState(() {
                    _selectedPopular = item;
                    _searchController.text = item;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
