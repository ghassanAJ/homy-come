import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_ref_model.freezed.dart';
part 'role_ref_model.g.dart';

@freezed
abstract class RoleRefModel with _$RoleRefModel {
  const factory RoleRefModel({
    String? id,
    @JsonKey(name: 'documentId') String? documentId,
    String? name,
    String? code,
    String? description,
  }) = _RoleRefModel;

  factory RoleRefModel.fromJson(Map<String, dynamic> json) =>
      _$RoleRefModelFromJson(json);
}
