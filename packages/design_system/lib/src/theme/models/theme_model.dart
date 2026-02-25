import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme_model.g.dart';

/// Base class for color values
class ColorValue {
  /// Hex color value (e.g., "#FFFFFF")
  final String hexValue;

  /// Creates a ColorValue with a hex string
  ColorValue({required this.hexValue});

  /// Converts the hex color string to a Color object
  Color get color {
    final hexString = hexValue.replaceFirst('#', '');
    final colorValue = int.parse(hexString, radix: 16);
    return Color(colorValue | 0xFF000000); // Add alpha value if needed
  }

  /// Factory method to create from a hex string
  factory ColorValue.fromHex(String hex) => ColorValue(hexValue: hex);
}

/// Primary colors in a theme
@JsonSerializable()
class PrimaryColors {
  @JsonKey(name: 'p1')
  final String p1;

  @JsonKey(name: 'p2')
  final String p2;

  @JsonKey(name: 'p3')
  final String p3;

  PrimaryColors({
    required this.p1,
    required this.p2,
    required this.p3,
  });

  factory PrimaryColors.fromJson(Map<String, dynamic> json) =>
      _$PrimaryColorsFromJson(json);

  Map<String, dynamic> toJson() => _$PrimaryColorsToJson(this);
}

/// Secondary colors in a theme
@JsonSerializable()
class SecondaryColors {
  @JsonKey(name: 's1')
  final String s1;

  @JsonKey(name: 's2')
  final String s2;

  SecondaryColors({
    required this.s1,
    required this.s2,
  });

  factory SecondaryColors.fromJson(Map<String, dynamic> json) =>
      _$SecondaryColorsFromJson(json);

  Map<String, dynamic> toJson() => _$SecondaryColorsToJson(this);
}

/// Grey colors in a theme
@JsonSerializable()
class GreyColors {
  @JsonKey(name: '800')
  final String shade800;

  @JsonKey(name: '600')
  final String shade600;

  @JsonKey(name: '500')
  final String shade500;

  @JsonKey(name: '400')
  final String shade400;

  @JsonKey(name: '300')
  final String shade300;

  @JsonKey(name: '200')
  final String shade200;

  @JsonKey(name: '100')
  final String shade100;

  @JsonKey(name: '000')
  final String shade000;

  GreyColors({
    required this.shade800,
    required this.shade600,
    required this.shade500,
    required this.shade400,
    required this.shade300,
    required this.shade200,
    required this.shade100,
    required this.shade000,
  });

  factory GreyColors.fromJson(Map<String, dynamic> json) =>
      _$GreyColorsFromJson(json);

  Map<String, dynamic> toJson() => _$GreyColorsToJson(this);
}

/// System colors in a theme
@JsonSerializable()
class SystemColors {
  @JsonKey(name: 'error')
  final String error;

  @JsonKey(name: 'success')
  final String success;

  @JsonKey(name: 'warning')
  final String warning;

  SystemColors({
    required this.error,
    required this.success,
    required this.warning,
  });

  factory SystemColors.fromJson(Map<String, dynamic> json) =>
      _$SystemColorsFromJson(json);

  Map<String, dynamic> toJson() => _$SystemColorsToJson(this);
}

/// Theme color palette
@JsonSerializable()
class ThemePalette {
  @JsonKey(name: 'primary')
  final PrimaryColors primary;

  @JsonKey(name: 'secondary') 
  final SecondaryColors secondary;

  @JsonKey(name: 'shade')
  final GreyColors shade;

  @JsonKey(name: 'system')
  final SystemColors system;

  ThemePalette({
    required this.primary,
    required this.secondary,
    required this.shade,
    required this.system,
  });

  factory ThemePalette.fromJson(Map<String, dynamic> json) =>
      _$ThemePaletteFromJson(json);

  Map<String, dynamic> toJson() => _$ThemePaletteToJson(this);
}

/// Theme model
@JsonSerializable()
class ThemeModel {
  @JsonKey(name: 'default')
  final ThemePalette defaultTheme;

  @JsonKey(name: 'light')
  final ThemePalette lightTheme;

  @JsonKey(name: 'dark', includeIfNull: false)
  final ThemePalette? darkTheme;

  ThemeModel({
    required this.defaultTheme,
    required this.lightTheme,
    this.darkTheme,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeModelToJson(this);
}
