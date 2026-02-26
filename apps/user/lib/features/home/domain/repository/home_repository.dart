import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/entities/search_content.dart';

abstract class HomeRepository {
  HomeContent getHomeContent();
  SearchContent getSearchContent();
}
