import 'package:booking/src/data/model/res/detail_point_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_detail_item_model.freezed.dart';
part 'service_detail_item_model.g.dart';

@freezed
abstract class ServiceDetailsModel with _$ServiceDetailsModel {
  const factory ServiceDetailsModel({
    int? id,
    String? title,
    @Default([]) List<DetailPointModel> points,
  }) = _ServiceDetailItemModel;

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceDetailItemModelFromJson(json);
}
