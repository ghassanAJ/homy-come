// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_and_condition_model.freezed.dart';
part 'terms_and_condition_model.g.dart';

@freezed
abstract class TermsAndConditionModel with _$TermsAndConditionModel {
  const factory TermsAndConditionModel({
    @Default('') String description,
  }) = _TermsAndConditionModel;

  factory TermsAndConditionModel.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionModelFromJson(json);
}
