import 'package:injectable/injectable.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/entities/search_content.dart';
import 'package:user/features/home/domain/repository/mock_home_api_repository.dart';

@injectable
class HomeAPI {
  HomeContent getHomeContent() => homeMockContent;

  SearchContent getSearchContent() => searchMockContent;
}
