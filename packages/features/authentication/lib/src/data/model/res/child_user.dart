import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:json_annotation/json_annotation.dart';

part 'child_user.g.dart';

@JsonSerializable(explicitToJson: true)
class ChildUser extends UserModel {
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @JsonKey(name: 'updated_by')
  final String? updatedBy;

  @JsonKey(name: 'login_code')
  final String? loginCode;

  @JsonKey(name: 'parents')
  final List<ParentUser>? parents;

  @JsonKey(name: 'avatar_color', fromJson: AvatarColorExtension.fromString)
  final AvatarColor? avatarColor;

  const ChildUser({
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
    this.createdBy,
    this.updatedBy,
    this.loginCode,
    this.parents,
    this.avatarColor,
  });

  @override
  UserType get type => UserType.child;

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
    createdBy,
    updatedBy,
    loginCode,
    parents,
    avatarColor,
  ];

  factory ChildUser.fromJson(Map<String, dynamic> json) =>
      _$ChildUserFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final json = _$ChildUserToJson(this);
    json['type'] = 'child';
    return json;
  }

  ChildUser copyWith({
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
    String? createdBy,
    String? updatedBy,
    String? loginCode,
    List<ParentUser>? parents,
    AvatarColor? avatarColor,
  }) {
    return ChildUser(
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
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      loginCode: loginCode ?? this.loginCode,
      parents: parents ?? this.parents,
      avatarColor: avatarColor ?? this.avatarColor,
    );
  }

  @override
  String toString() {
    return 'ChildUser(id: $id, firstName: $firstName, lastName: $lastName, createdBy: $createdBy)';
  }
}

enum AvatarColor { primary, warning, tertiary }

extension AvatarColorExtension on AvatarColor {
  UIColor get color => switch (this) {
    AvatarColor.primary => UIColor.primary,
    AvatarColor.warning => UIColor.warning,
    AvatarColor.tertiary => UIColor.tertiary,
  };
  String get name => switch (this) {
    AvatarColor.primary => 'primary',
    AvatarColor.warning => 'warning',
    AvatarColor.tertiary => 'tertiary',
  };
  static AvatarColor fromString(String? value) =>
      AvatarColor.values.firstWhere((e) => e.name == (value ?? 'primary'));
}
