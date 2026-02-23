// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildUser _$ChildUserFromJson(Map<String, dynamic> json) => ChildUser(
  id: json['id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  dob: json['dob'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  username: json['username'] as String?,
  nickname: json['nickname'] as String?,
  gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
  profilePicture: json['profile_picture'] as String?,
  address: json['address'] as Map<String, dynamic>?,
  countryCode: json['country_code'] as String?,
  emailVerified: json['email_verified'] as bool?,
  phoneVerified: json['phone_verified'] as bool?,
  profileCompleted: json['profile_completed'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  status: json['status'] as String?,
  createdBy: json['created_by'] as String?,
  updatedBy: json['updated_by'] as String?,
  loginCode: json['login_code'] as String?,
  parents:
      (json['parents'] as List<dynamic>?)
          ?.map((e) => ParentUser.fromJson(e as Map<String, dynamic>))
          .toList(),
  avatarColor: AvatarColorExtension.fromString(json['avatar_color'] as String?),
);

Map<String, dynamic> _$ChildUserToJson(ChildUser instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'profile_picture': instance.profilePicture,
  'dob': instance.dob,
  'email': instance.email,
  'phone': instance.phone,
  'username': instance.username,
  'nickname': instance.nickname,
  'gender': _$GenderEnumMap[instance.gender],
  'address': instance.address,
  'country_code': instance.countryCode,
  'email_verified': instance.emailVerified,
  'phone_verified': instance.phoneVerified,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'profile_completed': instance.profileCompleted,
  'status': instance.status,
  'last_name': instance.lastName,
  'created_by': instance.createdBy,
  'updated_by': instance.updatedBy,
  'login_code': instance.loginCode,
  'parents': instance.parents?.map((e) => e.toJson()).toList(),
  'avatar_color': _$AvatarColorEnumMap[instance.avatarColor],
};

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$AvatarColorEnumMap = {
  AvatarColor.primary: 'primary',
  AvatarColor.warning: 'warning',
  AvatarColor.tertiary: 'tertiary',
};
