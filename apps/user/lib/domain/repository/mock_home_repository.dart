import 'package:user/data/mock/home_mock_data.dart';
import 'package:user/data/model/home_content.dart';
import 'package:user/domain/repository/home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  HomeContent getHomeContent() => homeMockContent;
}
