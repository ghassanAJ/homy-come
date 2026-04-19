import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_point_model.freezed.dart';
part 'detail_point_model.g.dart';

@freezed
abstract class DetailPointModel with _$DetailPointModel {
  const factory DetailPointModel({
    String? id,
    String? text,
  }) = _DetailPointModel;

  factory DetailPointModel.fromJson(Map<String, dynamic> json) =>
      _$DetailPointModelFromJson(json);
}
