// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceOptionModel _$ServiceOptionModelFromJson(Map<String, dynamic> json) =>
    _ServiceOptionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      description: json['description'] as String,
      originalPrice: (json['original_price'] as num).toDouble(),
      discountedPrice: (json['discounted_price'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'AED',
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$ServiceOptionModelToJson(_ServiceOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration_minutes': instance.durationMinutes,
      'description': instance.description,
      'original_price': instance.originalPrice,
      'discounted_price': instance.discountedPrice,
      'currency': instance.currency,
      'image_url': instance.imageUrl,
    };
