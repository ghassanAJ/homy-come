import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc_event.freezed.dart';

@freezed
sealed class HomeBlocEvent with _$HomeBlocEvent {
  const factory HomeBlocEvent.loadCategories() = LoadHomeContentEvent;
  const factory HomeBlocEvent.loadSliders() = LoadSlidersEvent;
  const factory HomeBlocEvent.loadOffers() = LoadOffersEvent;
  const factory HomeBlocEvent.loadStories() = LoadStoriesEvent;
  const factory HomeBlocEvent.loadCategoryServices(String categoryId) =
      LoadCategoryServicesEvent;
  const factory HomeBlocEvent.loadServiceDetails(
    GetServiceDetailsRequestModel request,
  ) = LoadServiceDetailsEvent;
  const factory HomeBlocEvent.loadSearchContent(String qwery) =
      LoadSearchContentEvent;
}
