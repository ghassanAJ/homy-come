// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authentication/authentication.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'child_user.dart';
import 'parent_user.dart';
import 'user_type.dart';

abstract class BaseUserModel extends Equatable {
  final String id;
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  const BaseUserModel({
    required this.id,
    required this.firstName,
    this.profilePicture,
  });
  @override
  List<Object?> get props => [firstName, id, profilePicture];
}

class ChildPreivewModel extends BaseUserModel {
  final AvatarColor? avatarColor;
  const ChildPreivewModel({
    required super.id,
    required super.firstName,
    required super.profilePicture,
    required this.avatarColor,
  });

  factory ChildPreivewModel.fromJson(Map<String, dynamic> json) =>
      ChildPreivewModel(
        id: json['id'],
        firstName: json['first_name'],
        profilePicture: json['profile_picture'],
        avatarColor: AvatarColorExtension.fromString(json['avatar_color']),
      );
  Map<dynamic, dynamic> toJson() {
    return {};
  }
}

@JsonSerializable()
abstract class UserModel extends BaseUserModel {
  final String dob;

  final String? email;
  final String? phone;
  final String? username;
  final String? nickname;
  final Gender? gender;
  final Map<String, dynamic>? address;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'email_verified')
  final bool? emailVerified;
  @JsonKey(name: 'phone_verified')
  final bool? phoneVerified;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'profile_completed')
  final bool? profileCompleted;

  final String? status;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;

  const UserModel({
    required super.id,
    required super.firstName,
    required this.lastName,
    required this.dob,
    this.email,
    this.phone,
    this.username,
    this.nickname,
    this.gender,
    super.profilePicture,
    this.address,
    this.countryCode,
    this.emailVerified,
    this.phoneVerified,
    this.createdAt,
    this.updatedAt,
    this.profileCompleted,
    this.status,
  });

  String get fullName => '$firstName $lastName';

  /// Checks if the user has completed all required profile information
  /// Uses the backend's profile_completed flag for single source of truth
  bool get hasCompletedProfile {
    return profileCompleted ?? false;
  }

  UserType get type;

  Map<String, dynamic> toJson();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userType = json['type'] as String?;

    if (userType == 'child') {
      return ChildUser.fromJson(json);
    }

    // Default to parent
    return ParentUser.fromJson(json);
  }
}
