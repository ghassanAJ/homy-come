// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceDetailsResponseModel _$ServiceDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ServiceDetailsResponseModel(
  id: json['id'] as String,
  rating: (json['rating'] as num).toInt(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
  info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  price: ServicePriceModel.fromJson(json['price'] as Map<String, dynamic>),
  categories:
      (json['categories'] as List<dynamic>?)
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
  'info': instance.info,
  'price': instance.price,
  'categories': instance.categories,
};

_ServicePreviewResponseModel _$ServicePreviewResponseModelFromJson(
  Map<String, dynamic> json,
) => _ServicePreviewResponseModel(
  id: json['id'] as String,
  info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  priceModel: ServicePriceModel.fromJson(json['price'] as Map<String, dynamic>),
  rating: (json['rating'] as num).toInt(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
);

Map<String, dynamic> _$ServicePreviewResponseModelToJson(
  _ServicePreviewResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'info': instance.info,
  'price': instance.priceModel,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
};
