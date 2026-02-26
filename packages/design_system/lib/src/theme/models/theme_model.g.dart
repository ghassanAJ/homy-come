// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimaryColors _$PrimaryColorsFromJson(Map<String, dynamic> json) =>
    PrimaryColors(
      p1: json['p1'] as String,
      p2: json['p2'] as String,
      p3: json['p3'] as String,
    );

Map<String, dynamic> _$PrimaryColorsToJson(PrimaryColors instance) =>
    <String, dynamic>{'p1': instance.p1, 'p2': instance.p2, 'p3': instance.p3};

SecondaryColors _$SecondaryColorsFromJson(Map<String, dynamic> json) =>
    SecondaryColors(s1: json['s1'] as String, s2: json['s2'] as String);

Map<String, dynamic> _$SecondaryColorsToJson(SecondaryColors instance) =>
    <String, dynamic>{'s1': instance.s1, 's2': instance.s2};

GreyColors _$GreyColorsFromJson(Map<String, dynamic> json) => GreyColors(
  shade800: json['800'] as String,
  shade600: json['600'] as String,
  shade500: json['500'] as String,
  shade400: json['400'] as String,
  shade300: json['300'] as String,
  shade200: json['200'] as String,
  shade100: json['100'] as String,
  shade000: json['000'] as String,
);

Map<String, dynamic> _$GreyColorsToJson(GreyColors instance) =>
    <String, dynamic>{
      '800': instance.shade800,
      '600': instance.shade600,
      '500': instance.shade500,
      '400': instance.shade400,
      '300': instance.shade300,
      '200': instance.shade200,
      '100': instance.shade100,
      '000': instance.shade000,
    };

SystemColors _$SystemColorsFromJson(Map<String, dynamic> json) => SystemColors(
  error: json['error'] as String,
  success: json['success'] as String,
  warning: json['warning'] as String,
);

Map<String, dynamic> _$SystemColorsToJson(SystemColors instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'warning': instance.warning,
    };

ThemePalette _$ThemePaletteFromJson(Map<String, dynamic> json) => ThemePalette(
  primary: PrimaryColors.fromJson(json['primary'] as Map<String, dynamic>),
  secondary: SecondaryColors.fromJson(
    json['secondary'] as Map<String, dynamic>,
  ),
  shade: GreyColors.fromJson(json['shade'] as Map<String, dynamic>),
  system: SystemColors.fromJson(json['system'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ThemePaletteToJson(ThemePalette instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'shade': instance.shade,
      'system': instance.system,
    };

ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) => ThemeModel(
  defaultTheme: ThemePalette.fromJson(json['default'] as Map<String, dynamic>),
  lightTheme: ThemePalette.fromJson(json['light'] as Map<String, dynamic>),
  darkTheme:
      json['dark'] == null
          ? null
          : ThemePalette.fromJson(json['dark'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ThemeModelToJson(ThemeModel instance) =>
    <String, dynamic>{
      'default': instance.defaultTheme,
      'light': instance.lightTheme,
      'dark': instance.darkTheme,
    };
