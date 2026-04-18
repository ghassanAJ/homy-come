import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_category_model.freezed.dart';
part 'service_category_model.g.dart';

@freezed
abstract class ServiceCategoryModel with _$ServiceCategoryModel {
  const factory ServiceCategoryModel({
    required int id,
    required String documentId,
    required InfoModel info,
    @Default(0) int servicesCount,
    @Default([]) List<ServicePreviewResponseModel> services,
  }) = _ServiceCategoryModel;

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryModelFromJson(json);
}
