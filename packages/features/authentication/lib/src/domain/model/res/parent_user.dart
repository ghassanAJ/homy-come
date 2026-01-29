import 'package:authentication/authentication.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_model_base.dart';
import 'user_type.dart';

part 'parent_user.g.dart';

@JsonSerializable()
class ParentUser extends UserModel {
  @JsonKey(name: 'cognito_id')
  final String cognitoId;

  const ParentUser({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.dob,
    super.email,
    super.phone,
    super.username,
    super.nickname,
    super.gender,
    super.profilePicture,
    super.address,
    super.countryCode,
    super.emailVerified,
    super.phoneVerified,
    super.profileCompleted,
    super.createdAt,
    super.updatedAt,
    super.status,
    required this.cognitoId,
  });

  @override
  UserType get type => UserType.parent;

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    dob,
    email,
    phone,
    username,
    nickname,
    gender,
    profilePicture,
    address,
    countryCode,
    emailVerified,
    phoneVerified,
    profileCompleted,
    createdAt,
    updatedAt,
    status,
    cognitoId,
  ];

  factory ParentUser.fromJson(Map<String, dynamic> json) =>
      _$ParentUserFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final json = _$ParentUserToJson(this);
    json['type'] = 'parent';
    return json;
  }

  ParentUser copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? dob,
    String? email,
    String? phone,
    String? username,
    String? nickname,
    Gender? gender,
    String? profilePicture,
    Map<String, dynamic>? address,
    String? countryCode,
    bool? emailVerified,
    bool? phoneVerified,
    bool? profileCompleted,
    String? createdAt,
    String? updatedAt,
    String? status,
    String? cognitoId,
  }) {
    return ParentUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      profilePicture: profilePicture ?? this.profilePicture,
      address: address ?? this.address,
      countryCode: countryCode ?? this.countryCode,
      emailVerified: emailVerified ?? this.emailVerified,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      profileCompleted: profileCompleted ?? this.profileCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      cognitoId: cognitoId ?? this.cognitoId,
    );
  }

  @override
  String toString() {
    return 'ParentUser(id: $id, firstName: $firstName, lastName: $lastName, cognitoId: $cognitoId)';
  }
}
