// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatedByModel _$CreatedByModelFromJson(Map<String, dynamic> json) =>
    _CreatedByModel(
      id: json['id'] as String?,
      documentId: json['documentId'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      resetPasswordToken: json['resetPasswordToken'] as String?,
      registrationToken: json['registrationToken'] as String?,
      isActive: json['isActive'] as bool?,
      roles:
          (json['roles'] as List<dynamic>?)
              ?.map((e) => RoleRefModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      blocked: json['blocked'] as bool?,
      preferedLanguage: json['preferedLanguage'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      createdBy:
          json['createdBy'] == null
              ? null
              : DocumentRefModel.fromJson(
                json['createdBy'] as Map<String, dynamic>,
              ),
      updatedBy:
          json['updatedBy'] == null
              ? null
              : DocumentRefModel.fromJson(
                json['updatedBy'] as Map<String, dynamic>,
              ),
      locale: json['locale'] as String?,
      localizations:
          (json['localizations'] as List<dynamic>?)
              ?.map((e) => DocumentRefModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CreatedByModelToJson(_CreatedByModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'username': instance.username,
      'email': instance.email,
      'resetPasswordToken': instance.resetPasswordToken,
      'registrationToken': instance.registrationToken,
      'isActive': instance.isActive,
      'roles': instance.roles,
      'blocked': instance.blocked,
      'preferedLanguage': instance.preferedLanguage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'locale': instance.locale,
      'localizations': instance.localizations,
    };
