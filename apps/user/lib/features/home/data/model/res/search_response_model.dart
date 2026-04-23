import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response_model.freezed.dart';
part 'search_response_model.g.dart';

@freezed
abstract class SearchResponseModel with _$SearchResponseModel {
  const factory SearchResponseModel({
    @Default([]) List<String> popularSearch,
    @Default([]) List<ServiceCategoryModel> topCategories,
    @Default([]) List<ServicePreviewResponseModel> services,
  }) = _SearchResponseModel;

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);
}
