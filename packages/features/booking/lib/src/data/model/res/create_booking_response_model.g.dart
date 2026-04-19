// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateBookingResponseModel _$CreateBookingResponseModelFromJson(
  Map<String, dynamic> json,
) => _CreateBookingResponseModel(
  scheduledAt: DateTime.parse(json['scheduled_at'] as String),
  durationMinutes: (json['duration_minutes'] as num).toInt(),
  finalPrice: (json['final_price'] as num).toDouble(),
  commissionAmount: (json['commission_amount'] as num).toDouble(),
  providerEarning: (json['provider_earning'] as num).toDouble(),
  status: json['status'] as String,
  service: json['service'] as String,
  addOns: (json['add_ons'] as List<dynamic>).map((e) => e as String).toList(),
  customer: json['customer'] as String,
  address: BookingAddressModel.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
  providers:
      (json['providers'] as List<dynamic>).map((e) => e as String).toList(),
  needCleaningMaterials: json['need_cleaning_materials'] as bool,
  specificInstructions: json['specifc_instructions'] as String?,
);

Map<String, dynamic> _$CreateBookingResponseModelToJson(
  _CreateBookingResponseModel instance,
) => <String, dynamic>{
  'scheduled_at': instance.scheduledAt.toIso8601String(),
  'duration_minutes': instance.durationMinutes,
  'final_price': instance.finalPrice,
  'commission_amount': instance.commissionAmount,
  'provider_earning': instance.providerEarning,
  'status': instance.status,
  'service': instance.service,
  'add_ons': instance.addOns,
  'customer': instance.customer,
  'address': instance.address,
  'providers': instance.providers,
  'need_cleaning_materials': instance.needCleaningMaterials,
  'specifc_instructions': instance.specificInstructions,
};
