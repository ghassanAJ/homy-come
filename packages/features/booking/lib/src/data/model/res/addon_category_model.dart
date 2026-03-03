import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'addon_category_model.freezed.dart';
part 'addon_category_model.g.dart';

@freezed
abstract class AddOnCategoryModel with _$AddOnCategoryModel {
  const factory AddOnCategoryModel({
    required String id,
    required String documentId,
    @Default([]) List<AddOnServiceModel> services,
    InfoModel? info,
  }) = _AddOnCategoryModel;

  factory AddOnCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$AddOnCategoryModelFromJson(json);
}
