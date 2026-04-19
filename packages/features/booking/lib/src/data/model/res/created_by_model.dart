import 'package:booking/src/data/model/res/document_ref_model.dart';
import 'package:booking/src/data/model/res/role_ref_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_by_model.freezed.dart';
part 'created_by_model.g.dart';

@freezed
abstract class CreatedByModel with _$CreatedByModel {
  const factory CreatedByModel({
    String? id,
    @JsonKey(name: 'documentId') String? documentId,
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    @JsonKey(name: 'resetPasswordToken') String? resetPasswordToken,
    @JsonKey(name: 'registrationToken') String? registrationToken,
    @JsonKey(name: 'isActive') bool? isActive,
    @Default([]) List<RoleRefModel> roles,
    bool? blocked,
    @JsonKey(name: 'preferedLanguage') String? preferedLanguage,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'publishedAt') String? publishedAt,
    @JsonKey(name: 'createdBy') DocumentRefModel? createdBy,
    @JsonKey(name: 'updatedBy') DocumentRefModel? updatedBy,
    String? locale,
    @Default([]) List<DocumentRefModel> localizations,
  }) = _CreatedByModel;

  factory CreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByModelFromJson(json);
}
