// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingModelResponse _$BookingModelResponseFromJson(
  Map<String, dynamic> json,
) => _BookingModelResponse(
  id: (json['id'] as num).toInt(),
  serviceType: json['service_type'] as String,
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  provider: ProviderModel.fromJson(json['provider'] as Map<String, dynamic>),
  date: json['date'] as String,
  time: json['time'] as String,
  address: json['address'] as String,
);

Map<String, dynamic> _$BookingModelResponseToJson(
  _BookingModelResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'service_type': instance.serviceType,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'provider': instance.provider,
  'date': instance.date,
  'time': instance.time,
  'address': instance.address,
};

const _$OrderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.canceled: 'canceled',
  OrderStatus.completed: 'completed',
  OrderStatus.scheduled: 'scheduled',
  OrderStatus.inProgress: 'inProgress',
};

_ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) =>
    _ProviderModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      numberPhone: json['numberPhone'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProviderModelToJson(_ProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'numberPhone': instance.numberPhone,
      'image': instance.image,
    };

_BookingDetailseModelResponse _$BookingDetailseModelResponseFromJson(
  Map<String, dynamic> json,
) => _BookingDetailseModelResponse(
  id: (json['id'] as num).toInt(),
  serviceType: json['service_type'] as String,
  status: json['status'] as String,
  provider: ProviderModel.fromJson(json['provider'] as Map<String, dynamic>),
  date: json['date'] as String,
  time: json['time'] as String,
  address: json['address'] as String,
  workingHour: (json['workingHour'] as num).toInt(),
  servicesCharge: (json['servicesCharge'] as num).toInt(),
  deepCleaning: (json['deepCleaning'] as num).toInt(),
);

Map<String, dynamic> _$BookingDetailseModelResponseToJson(
  _BookingDetailseModelResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'service_type': instance.serviceType,
  'status': instance.status,
  'provider': instance.provider,
  'date': instance.date,
  'time': instance.time,
  'address': instance.address,
  'workingHour': instance.workingHour,
  'servicesCharge': instance.servicesCharge,
  'deepCleaning': instance.deepCleaning,
};
