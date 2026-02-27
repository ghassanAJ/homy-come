import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/api/home_api.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/entities/search_content.dart';

abstract class HomeRepository {
  HomeContent getHomeContent();
  SearchContent getSearchContent();
}

@Injectable(as: HomeRepository, env: ['prod', 'dev'])
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeAPI);

  final HomeAPI _homeAPI;

  @override
  HomeContent getHomeContent() => _homeAPI.getHomeContent();

  @override
  SearchContent getSearchContent() => _homeAPI.getSearchContent();
}
