// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_app_model.freezed.dart';
part 'about_app_model.g.dart';

@freezed
abstract class AboutAppModel with _$AboutAppModel {
  const factory AboutAppModel({
    @Default('') String description,
  }) = _AboutAppModel;

  factory AboutAppModel.fromJson(Map<String, dynamic> json) =>
      _$AboutAppModelFromJson(json);
}
