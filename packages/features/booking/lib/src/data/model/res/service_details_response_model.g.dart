// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceDetailsResponseModel _$ServiceDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ServiceDetailsResponseModel(
  id: json['id'] as String,
  title: json['title'] as String,
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  featuredOption:
      json['featured_option'] == null
          ? null
          : ServiceOptionModel.fromJson(
            json['featured_option'] as Map<String, dynamic>,
          ),
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map((e) => ServiceSectionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceDetailsResponseModelToJson(
  _ServiceDetailsResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'categories': instance.categories,
  'featured_option': instance.featuredOption,
  'sections': instance.sections,
};

_ServicePreviewResponseModel _$ServicePreviewResponseModelFromJson(
  Map<String, dynamic> json,
) => _ServicePreviewResponseModel(
  id: json['id'] as String,
  info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  rating: (json['rating'] as num).toInt(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
);

Map<String, dynamic> _$ServicePreviewResponseModelToJson(
  _ServicePreviewResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'info': instance.info,
  'rating': instance.rating,
  'reviewsCount': instance.reviewsCount,
};
