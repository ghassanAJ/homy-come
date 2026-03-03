// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_detail_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceDetailItemModel _$ServiceDetailItemModelFromJson(
  Map<String, dynamic> json,
) => _ServiceDetailItemModel(
  id: json['id'] as String?,
  title: json['title'] as String?,
  points:
      (json['points'] as List<dynamic>?)
          ?.map((e) => DetailPointModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceDetailItemModelToJson(
  _ServiceDetailItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'points': instance.points,
};
