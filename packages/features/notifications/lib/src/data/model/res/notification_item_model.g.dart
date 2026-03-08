// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationItemModel _$NotificationItemModelFromJson(
  Map<String, dynamic> json,
) => _NotificationItemModel(
  id: json['id'] as String?,
  title: json['title'] as String,
  description: json['description'] as String,
  timeAgo: json['time_ago'] as String,
  createdAt: _createdAtFromJson(json['created_at']),
  isHighlighted: json['is_highlighted'] as bool? ?? false,
);

Map<String, dynamic> _$NotificationItemModelToJson(
  _NotificationItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'time_ago': instance.timeAgo,
  'created_at': _createdAtToJson(instance.createdAt),
  'is_highlighted': instance.isHighlighted,
};
