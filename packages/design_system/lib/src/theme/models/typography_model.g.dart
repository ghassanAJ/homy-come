// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typography_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypographyToken _$TypographyTokenFromJson(Map<String, dynamic> json) =>
    TypographyToken(
      fontSize: (json['fontSize'] as num).toDouble(),
      fontWeight: (json['fontWeight'] as num).toInt(),
      lineHeight: (json['lineHeight'] as num).toDouble(),
    );

Map<String, dynamic> _$TypographyTokenToJson(TypographyToken instance) =>
    <String, dynamic>{
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'lineHeight': instance.lineHeight,
    };

TypographyCategory _$TypographyCategoryFromJson(Map<String, dynamic> json) =>
    TypographyCategory(fontFamily: json['fontFamily'] as String);

Map<String, dynamic> _$TypographyCategoryToJson(TypographyCategory instance) =>
    <String, dynamic>{'fontFamily': instance.fontFamily};
