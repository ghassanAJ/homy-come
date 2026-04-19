// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    _HomeResponseModel(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map(
                (e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      offers:
          (json['offers'] as List<dynamic>?)
              ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sliders:
          (json['sliders'] as List<dynamic>?)
              ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeResponseModelToJson(_HomeResponseModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'offers': instance.offers,
      'sliders': instance.sliders,
    };

_OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => _OfferModel(
  imageUrl: json['image_url'] as String?,
  service:
      json['service'] == null
          ? null
          : ServicePreviewResponseModel.fromJson(
            json['service'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$OfferModelToJson(_OfferModel instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'service': instance.service,
    };
