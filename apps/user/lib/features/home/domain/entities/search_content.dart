import 'package:user/features/home/domain/entities/home_content.dart';

class SearchContent {
  const SearchContent({
    required this.popularSearch,
    required this.topServices,
  });

  final List<String> popularSearch;
  final List<HomeCategoryItem> topServices;
}
