import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_ref_model.freezed.dart';
part 'document_ref_model.g.dart';

@freezed
abstract class DocumentRefModel with _$DocumentRefModel {
  const factory DocumentRefModel({
    String? id,
    @JsonKey(name: 'documentId') String? documentId,
  }) = _DocumentRefModel;

  factory DocumentRefModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentRefModelFromJson(json);
}
