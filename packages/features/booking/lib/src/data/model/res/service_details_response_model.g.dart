// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceDetailsResponseModel _$ServiceDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ServiceDetailsResponseModel(
  id: (json['id'] as num).toInt(),
  rating: (json['rating'] as num?)?.toInt(),
  reviewsCount: (json['reviews_count'] as num?)?.toInt(),
  discountPercentage: (json['discount_percentage'] as num?)?.toDouble(),
  discountCode: json['discount_code'] as String?,
  info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  price: ServicePriceModel.fromJson(json['price'] as Map<String, dynamic>),
  addonCategories:
      (json['add_on_categories'] as List<dynamic>?)
          ?.map((e) => AddOnCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceDetailsResponseModelToJson(
  _ServiceDetailsResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
  'discount_percentage': instance.discountPercentage,
  'discount_code': instance.discountCode,
  'info': instance.info,
  'price': instance.price,
  'add_on_categories': instance.addonCategories,
};

_ServicePreviewResponseModel _$ServicePreviewResponseModelFromJson(
  Map<String, dynamic> json,
) => _ServicePreviewResponseModel(
  id: (json['id'] as num).toInt(),
  documentId: json['documentId'] as String,
  info:
      json['info'] == null
          ? null
          : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  priceModel:
      json['price'] == null
          ? null
          : ServicePriceModel.fromJson(json['price'] as Map<String, dynamic>),
  rating: (json['rating'] as num?)?.toInt(),
  reviewsCount: (json['reviews_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$ServicePreviewResponseModelToJson(
  _ServicePreviewResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'documentId': instance.documentId,
  'info': instance.info,
  'price': instance.priceModel,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
};
