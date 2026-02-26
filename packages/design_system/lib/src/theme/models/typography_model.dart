import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'typography_model.g.dart';

/// Base typography model that contains font properties
@JsonSerializable()
class TypographyToken {
  /// Font size in logical pixels
  final double fontSize;
  
  /// Font weight (400 = normal, 700 = bold)
  final int fontWeight;
  
  /// Line height in logical pixels
  final double lineHeight;

  /// Creates a TypographyToken
  TypographyToken({
     required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
  });

  /// Creates a TextStyle from this token
  TextStyle toTextStyle({String? fontFamily}) {
    // Using regular TextStyle for all fonts since we're using custom fonts
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: _fontWeightFromInt(fontWeight),
      height: lineHeight / fontSize,
      fontFamily: fontFamily,
    );
    
    // Apply scaling if needed
    // return TypographyScaling().scaleTextStyle(textStyle);
    return textStyle;
  }

  /// Converts JSON to TypographyToken
  factory TypographyToken.fromJson(Map<String, dynamic> json) =>
      _$TypographyTokenFromJson(json);

  /// Converts TypographyToken to JSON  
  Map<String, dynamic> toJson() => _$TypographyTokenToJson(this);
  
  /// Converts an integer font weight to Flutter's FontWeight
  FontWeight _fontWeightFromInt(int weight) {
    switch (weight) {
      case 100: return FontWeight.w100;
      case 200: return FontWeight.w200;
      case 300: return FontWeight.w300;
      case 400: return FontWeight.w400;
      case 500: return FontWeight.w500;
      case 600: return FontWeight.w600;
      case 700: return FontWeight.w700;
      case 800: return FontWeight.w800;
      case 900: return FontWeight.w900;
      default: return FontWeight.w400; // Default to normal weight
    }
  }
}

/// Typography category that contains multiple tokens
@JsonSerializable()
class TypographyCategory {
  /// The font family for this category
  final String fontFamily;
  
  /// The tokens in this category, mapped by name
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Map<String, TypographyToken> tokens = {};

  /// Creates a TypographyCategory
  TypographyCategory({required this.fontFamily});

  /// Converts JSON to TypographyCategory
  factory TypographyCategory.fromJson(Map<String, dynamic> json) {
    final category = _$TypographyCategoryFromJson(json);
    
    // Process tokens (all properties except fontFamily)
    json.forEach((key, value) {
      if (key != 'fontFamily' && value is Map<String, dynamic>) {
        category.tokens[key] = TypographyToken.fromJson(value);
      }
    });
    return category;
  }

  /// Converts TypographyCategory to JSON
  Map<String, dynamic> toJson() {
    final json = _$TypographyCategoryToJson(this);
    // Add all tokens to the JSON
    tokens.forEach((key, value) {
      json[key] = value.toJson();
    });
    return json;
  } 
}