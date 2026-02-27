import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/mock/home_mock_data.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/entities/search_content.dart';

@injectable
class HomeAPI {
  HomeContent getHomeContent() => homeMockContent;

  SearchContent getSearchContent() => searchMockContent;
}
