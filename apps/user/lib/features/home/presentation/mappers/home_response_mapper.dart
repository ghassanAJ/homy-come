import 'package:booking/booking.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/domain/entities/search_content.dart';

/// Maps [HomeResponseModel] to [HomeContent] for presentation.
HomeContent mapHomeResponseToContent(HomeResponseModel model) {
  return HomeContent(
    offers: model.offers.map(_offerToItem).toList(),
    categories: model.categories.map(_categoryToItem).toList(),
    stories: const [],
    generalServices: const [],
    plumberServices: const [],
    serviceOffers: const [],
  );
}

HomeOfferItem _offerToItem(OfferModel offer) => HomeOfferItem(
      image: offer.imageUrl ?? '',
      aspectRatio: offer.aspectRatio ?? 2 / 1,
    );

HomeCategoryItem _categoryToItem(ServiceCategoryModel category) {
  final iconPath = _categoryIconPath(category.name);
  return HomeCategoryItem(
    title: category.name,
    description: '${category.servicesCount} Services',
    iconPath: category.imageUrl ?? iconPath,
  );
}

String _categoryIconPath(String name) {
  final icons = Assets.icons;
  switch (name.toLowerCase()) {
    case 'carpenter':
      return icons.carpenter;
    case 'cleaner':
      return icons.cleaner;
    case 'painter':
      return icons.painter;
    case 'electrician':
      return icons.electrician;
    case 'plumber':
      return icons.plumber;
    default:
      return icons.navCategory;
  }
}

/// Maps [SearchResponseModel] to [SearchContent] for presentation.
SearchContent mapSearchResponseToContent(SearchResponseModel model) {
  return SearchContent(
    popularSearch: model.popularSearch,
    topServices: model.topCategories.map(_categoryToItem).toList(),
  );
}
