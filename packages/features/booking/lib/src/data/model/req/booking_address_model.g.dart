// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingAddressModel _$BookingAddressModelFromJson(Map<String, dynamic> json) =>
    _BookingAddressModel(
      id: json['id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BookingAddressModelToJson(
  _BookingAddressModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'name': instance.name,
};
