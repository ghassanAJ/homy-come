import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:util/util.dart';

part 'home_bloc_state.freezed.dart';

@freezed
abstract class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState.initial({
    @Default(HomeBlocStatus.initial) HomeBlocStatus status,
    @Default([]) List<ServiceCategoryModel> categories,
    @Default([]) List<ServicePreviewResponseModel> categoryServices,
    @Default([]) List<OfferModel> offers,
    @Default([]) List<OfferModel> sliders,
    SearchResponseModel? searchContent,
    ServiceDetailsResponseModel? serviceDetails,
    APIException? error,
  }) = _HomeBlocState;
}

enum HomeBlocErrorType { loadHomeContent, loadSearchContent }

enum HomeBlocStatus {
  initial,
  loadingCategories,
  loadingStories,
  loadingOffers,
  loadingServiceDetails,
  loadingSearchContent,
  loadingSliders,
  success,
  error,
}
