import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
abstract class InfoModel with _$InfoModel {
  const factory InfoModel({
    required int id,
    required String name,
    String? description,
    String? image,
  }) = _ServiceInfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}

@freezed
abstract class ProviderModel with _$ProviderModel {
  const factory ProviderModel({
    required int id,
    required String name,
    required double rating,
    String? image,
  }) = _ProviderModel;

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);
}
