import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/mappers/home_response_mapper.dart';
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: UIColor.background,

      body: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (context, state) {
          if (state.searchContentLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(
              child: Text(
                state.error?.message ?? '',
                style: TextStyle(color: UIColor.error),
              ),
            );
          }
          if (state.searchContent == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final searchContent = mapSearchResponseToContent(
            state.searchContent!,
          );
          final selectedPopular =
              _selectedPopular.isEmpty && searchContent.popularSearch.isNotEmpty
                  ? searchContent.popularSearch.first
                  : _selectedPopular;
          return UIEllipseBackground(
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
                    selectedPopular: selectedPopular,
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
          );
        },
      ),
    );
  }
}
