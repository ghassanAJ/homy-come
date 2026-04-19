import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_scroll_view_content.dart';

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
      appBarTitle: 'Categories',
      withBackButton: false,
      body: BlocSelector<HomeBloc, HomeBlocState, List<ServiceCategoryModel>>(
        selector: (state) => state.categories,
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return CategoriesScrollViewContent(
            searchController: _searchController,
            categories: [...state, ...state, ...state],
            bottomSafeArea: bottomSafeArea,
          );
        },
      ),
    );
  }
}
