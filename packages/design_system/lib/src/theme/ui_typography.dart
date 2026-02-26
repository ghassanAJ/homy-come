import 'package:flutter/material.dart';
import 'design_model_loader.dart';
import 'models/typography_model.dart';

import 'typography_scaling.dart';
import 'ui_theme.dart';

class UITypography {
  static final UITypography _instance = UITypography._internal();
  static bool _initialized = false;

  factory UITypography() => _instance;
  UITypography._internal();

  static final styles = _MDTypographyStyles._();

  final Map<String, TypographyCategory> _categories = {};
  final Map<String, TextStyle> _cachedStyles = {};

  static Future<void> initialize() async {
    if (_initialized) return;
    await _instance._loadTypography();
    _initialized = true;
  }

  static bool get isInitialized => _initialized;

  Future<void> _loadTypography() async {
    final typographySection = await DesignConfigLoader().getConfigSection(
      'typography',
    );

    typographySection.forEach((categoryName, categoryData) {
      if (categoryData is Map<String, dynamic>) {
        final category = TypographyCategory.fromJson(categoryData);
        _categories[categoryName] = category;
      }
    });

    _precacheStyles();
  }

  void _precacheStyles() {
    _categories.forEach((categoryName, category) {
      category.tokens.forEach((tokenName, _) {
        _cacheStyle(tokenName, category, tokenName);
      });
    });
  }

  void _cacheStyle(
    String cacheKey,
    TypographyCategory category,
    String tokenName,
  ) {
    final token = category.tokens[tokenName];
    if (token == null) {
      _cachedStyles[cacheKey] = const TextStyle();
      return;
    }

    TextStyle style = token.toTextStyle(fontFamily: category.fontFamily);

    if (UITheme.isInitialized) {
      final color = _getDefaultColor(cacheKey);
      if (color != null) {
        style = style.copyWith(color: color);
      }
    }

    _cachedStyles[cacheKey] = style;
  }

  Color? _getDefaultColor(String cacheKey) {
    if (cacheKey.startsWith('heading') || cacheKey.startsWith('button')) {
      return UITheme.styles.p3Color;
    }
    if (cacheKey.startsWith('body') ||
        cacheKey.contains('title') ||
        cacheKey.contains('subtitle')) {
      return UITheme.styles.p3Color;
    }
    return null;
  }

  void _checkInitialized() {
    if (!_initialized) {
      throw StateError(
        'MDTypography not initialized. Call MDTypography.initialize() before using typography methods.',
      );
    }
  }

  TextStyle _getStyle(String styleName) {
    _checkInitialized();
    return _cachedStyles[styleName] ?? const TextStyle();
  }

  TextStyle getStyle(String category, String token) {
    _checkInitialized();

    final cacheKey = '$category.$token';
    if (_cachedStyles.containsKey(cacheKey)) {
      return _cachedStyles[cacheKey]!;
    }

    final categoryData = _categories[category];
    if (categoryData == null) return const TextStyle();

    final tokenData = categoryData.tokens[token];
    if (tokenData == null) return const TextStyle();

    final style = tokenData.toTextStyle(fontFamily: categoryData.fontFamily);
    _cachedStyles[cacheKey] = style;
    return style;
  }

  /// Refreshes all cached styles
  /// Call this when the typography scaling changes
  void refreshStyles() {
    _cachedStyles.clear();
    _precacheStyles();
  }

  /// Updates typography scaling using MediaQueryData
  /// This should be called when the device text scale factor changes
  void updateTypographyScaling(MediaQueryData mediaQuery) {
    TypographyScaling().updateScalingFromMediaQuery(mediaQuery);
    refreshStyles();
  }

  void updateTypographyScalingFromContext(BuildContext context) {
    TypographyScaling().updateScalingFromContext(context);
    refreshStyles();
  }
}

class _MDTypographyStyles {
  const _MDTypographyStyles._();

  TextStyle _getStyle(String styleName) {
    return UITypography._instance._getStyle(styleName);
  }

  TextStyle get heading1 => _getStyle('heading1');
  TextStyle get heading2 => _getStyle('heading2');
  TextStyle get heading3 => _getStyle('heading3');
  TextStyle get heading4 => _getStyle('heading4');
  TextStyle get heading5 => _getStyle('heading5');

  TextStyle get title1 => _getStyle('title1');
  TextStyle get title2 => _getStyle('title2');
  TextStyle get subtitle => _getStyle('subtitle');

  TextStyle get body1 => _getStyle('body1');
  TextStyle get body1Emphasis => _getStyle('body1Emphasis');
  TextStyle get body2 => _getStyle('body2');
  TextStyle get body2Emphasis => _getStyle('body2Emphasis');
  TextStyle get body3 => _getStyle('body3');
  TextStyle get body3Emphasis => _getStyle('body3Emphasis');
  TextStyle get body4 => _getStyle('body4');
  TextStyle get body4Emphasis => _getStyle('body4Emphasis');
  TextStyle get body5 => _getStyle('body5');
  TextStyle get body5Emphasis => _getStyle('body5Emphasis');

  TextStyle get small => _getStyle('small');
  TextStyle get smallEmphasis => _getStyle('smallEmphasis');

  TextStyle get button1 => _getStyle('button1');
  TextStyle get button2 => _getStyle('button2');

  TextStyle getStyle(String category, String token) {
    return UITypography._instance.getStyle(category, token);
  }

  void refreshStyles() {
    UITypography._instance.refreshStyles();
  }

  void updateTypographyScaling(MediaQueryData mediaQuery) {
    UITypography._instance.updateTypographyScaling(mediaQuery);
  }

  void updateTypographyScalingFromContext(BuildContext context) {
    UITypography._instance.updateTypographyScalingFromContext(context);
  }

  TextStyle copyStyle(
    TextStyle baseStyle, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    return baseStyle.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}

extension MDStyleExtensions on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withEmphasis() => copyWith(fontWeight: FontWeight.bold);
  TextStyle withLightWeight() => copyWith(fontWeight: FontWeight.w300);

  TextStyle withPrimaryColor() => copyWith(color: UITheme.styles.p1Color);
  TextStyle withSecondaryColor() => copyWith(color: UITheme.styles.p2Color);
  TextStyle withAccentColor() => copyWith(color: UITheme.styles.p3Color);
}
