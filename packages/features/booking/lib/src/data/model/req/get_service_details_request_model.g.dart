// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetServiceDetailsRequestModel _$GetServiceDetailsRequestModelFromJson(
  Map<String, dynamic> json,
) => _GetServiceDetailsRequestModel(
  serviceId: json['serviceId'] as String,
  categoryId: json['category_id'] as String?,
  locationId: json['location_id'] as String?,
);

Map<String, dynamic> _$GetServiceDetailsRequestModelToJson(
  _GetServiceDetailsRequestModel instance,
) => <String, dynamic>{
  'serviceId': instance.serviceId,
  'category_id': instance.categoryId,
  'location_id': instance.locationId,
};
