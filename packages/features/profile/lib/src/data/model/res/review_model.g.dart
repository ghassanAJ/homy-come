// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  name: json['name'] as String? ?? '',
  timeAgo: json['time_ago'] as String? ?? '',
  comment: json['comment'] as String? ?? '',
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'time_ago': instance.timeAgo,
      'comment': instance.comment,
      'rating': instance.rating,
    };
