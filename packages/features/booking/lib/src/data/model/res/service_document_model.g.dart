// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceDocumentModel _$ServiceDocumentModelFromJson(
  Map<String, dynamic> json,
) => _ServiceDocumentModel(
  id: (json['id'] as num).toInt(),
  documentId: json['documentId'] as String,
  durationMinutes: (json['duration_minutes'] as num).toInt(),
  info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  price: ServicePriceModel.fromJson(json['price'] as Map<String, dynamic>),
  details:
      (json['details'] as List<dynamic>?)
          ?.map((e) => ServiceDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceDocumentModelToJson(
  _ServiceDocumentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'documentId': instance.documentId,
  'duration_minutes': instance.durationMinutes,
  'info': instance.info,
  'price': instance.price,
  'details': instance.details,
};
