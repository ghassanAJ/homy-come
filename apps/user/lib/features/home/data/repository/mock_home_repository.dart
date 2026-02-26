import 'package:user/features/home/data/mock/home_mock_data.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/entities/search_content.dart';
import 'package:user/features/home/domain/repository/home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  HomeContent getHomeContent() => homeMockContent;

  @override
  SearchContent getSearchContent() => searchMockContent;
}
