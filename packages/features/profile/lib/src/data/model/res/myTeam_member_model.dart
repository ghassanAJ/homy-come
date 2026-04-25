import 'package:freezed_annotation/freezed_annotation.dart';

part 'myTeam_member_model.freezed.dart';
part 'myTeam_member_model.g.dart';

@freezed
abstract class MyteamMemberModel with _$MyteamMemberModel {
  factory MyteamMemberModel({
    required int id,
    @JsonKey(name: 'name_member') required String nameMember,
    required String phone,
    required String imageUrl,
    required status,
  }) = _MyteamMemberModel;

  factory MyteamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$MyteamMemberModelFromJson(json);
}
