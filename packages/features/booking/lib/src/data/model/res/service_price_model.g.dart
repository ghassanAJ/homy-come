// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServicePriceModel _$ServicePriceModelFromJson(Map<String, dynamic> json) =>
    _ServicePriceModel(
      id: json['id'] as String?,
      currentPrice: json['current_price'] as num?,
      newPrice: json['new_price'] as num?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$ServicePriceModelToJson(_ServicePriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current_price': instance.currentPrice,
      'new_price': instance.newPrice,
      'currency': instance.currency,
    };
