// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    _SearchResponseModel(
      popularSearch:
          (json['popularSearch'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      topCategories:
          (json['topCategories'] as List<dynamic>?)
              ?.map(
                (e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchResponseModelToJson(
  _SearchResponseModel instance,
) => <String, dynamic>{
  'popularSearch': instance.popularSearch,
  'topCategories': instance.topCategories,
};
