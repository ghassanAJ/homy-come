import 'package:user/data/mock/home_mock_data.dart';
import 'package:user/data/model/home_content.dart';

abstract class HomeRepository {
  HomeContent getHomeContent();
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  HomeContent getHomeContent() => homeMockContent;
}
