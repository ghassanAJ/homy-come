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
    @Default(false) bool categoriesLoading,
    @Default(false) bool slidersLoading,
    @Default(false) bool storiesLoading,
    @Default(false) bool offersLoading,
    @Default(false) bool searchContentLoading,
    @Default(false) bool serviceDetailsLoading,
    @Default([]) List<ServiceCategoryModel> categories,
    @Default([]) List<ServicePreviewResponseModel> categoryServices,
    @Default([]) List<OfferModel> offers,
    @Default([]) List<OfferModel> sliders,
    @Default([]) List<OfferModel> stories,
    SearchResponseModel? searchContent,
    ServiceDetailsResponseModel? serviceDetails,
    APIException? error,
  }) = _HomeBlocState;
}

enum HomeBlocStatus { initial, success, error }
