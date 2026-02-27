import 'dart:developer' as developer;

import 'package:flutter/services.dart';

/// Manages loading of custom fonts for the MD Design System
class UIFontLoader {
  static const String _packagePath = 'packages/design_system/assets/fonts';
  static const Map<String, dynamic> _fontConfigs = {
    // 'Cocogoose': {
    //   'basePath': 'cocogoose',
    //   'variants': [
    //     'Cocogoose-Pro-Thin-trial.ttf',
    //     'Cocogoose-Pro-Ultralight-trial.ttf',
    //     'Cocogoose-Pro-Light-trial.ttf',
    //     'Cocogoose-Pro-Light-Italic-trial.ttf',
    //     'Cocogoose-Pro-Regular-trial.ttf',
    //     'Cocogoose-Pro-Regular-Italic-trial.ttf',
    //     'Cocogoose-Pro-Bold-trial.ttf',
    //     'Cocogoose-Pro-Bold-Italic-trial.ttf',
    //   ],
    // },
    // 'LemonMilk': {
    //   'basePath': 'lemonmilk',
    //   'variants': [
    //     'Lemon Milk Pro Ultra Light.otf',
    //     'Lemon Milk Pro Ultra Light Italic.otf',
    //     'Lemon Milk Pro Regular.otf',
    //     'Lemon Milk Pro Regular Italic.otf',
    //     'Lemon Milk Pro Medium.otf',
    //     'Lemon Milk Pro Medium Italic.otf',
    //     'Lemon Milk Pro Bold.otf',
    //     'Lemon Milk Pro Bold Italic.otf',
    //   ],
    // },
    'Cairo': {
      'basePath': 'cairo',
      'variants': [
        'Cairo-ExtraLight.ttf',
        'Cairo-Light.ttf',
        'Cairo-Regular.ttf',
        'Cairo-Medium.ttf',
        'Cairo-SemiBold.ttf',
        'Cairo-Bold.ttf',
        'Cairo-ExtraBold.ttf',
        'Cairo-Black.ttf',
      ],
    },
    'Montserrat': {
      'basePath': 'Montserrat',
      'variants': [
        'Montserrat-ExtraLight.ttf',
        'Montserrat-Light.ttf',
        'Montserrat-Regular.ttf',
        'Montserrat-SemiBold.ttf',
        'Montserrat-Bold.ttf',
        'Montserrat-ExtraBold.ttf',
        'Montserrat-Black.ttf',
      ],
    },
    'Roboto': {
      'basePath': 'Roboto',
      'variants': [
        'Roboto_Condensed-ExtraLight.ttf',
        'Roboto_Condensed-Light.ttf',
        'Roboto_Condensed-Regular.ttf',
        'Roboto_Condensed-Medium.ttf',
        'Roboto_Condensed-SemiBold.ttf',
        'Roboto_Condensed-Bold.ttf',
        'Roboto_Condensed-ExtraBold.ttf',
        'Roboto_Condensed-Black.ttf',
      ],
    },
    'DMSans': {
      'basePath': 'DMSens',
      'variants': [
        'DMSans-ExtraLight.ttf',
        'DMSans-Light.ttf',
        'DMSans-Regular.ttf',
        'DMSans-Medium.ttf',
        'DMSans-SemiBold.ttf',
        'DMSans-Bold.ttf',
        'DMSans-ExtraBold.ttf',
        'DMSans-Black.ttf',
      ],
    },
    'Lexend': {
      'basePath': 'Lexend',
      'variants': [
        'Lexend-ExtraLight.ttf',
        'Lexend-Light.ttf',
        'Lexend-Regular.ttf',
        'Lexend-Medium.ttf',
        'Lexend-SemiBold.ttf',
        'Lexend-Bold.ttf',
        'Lexend-ExtraBold.ttf',
        'Lexend-Black.ttf',
      ],
    },
    // 'IconsaxPlusBold': {
    //   'packagePath': 'packages/iconsax_plus/fonts',
    //   'variants': ['IconsaxPlusBold.ttf'],
    // },
    // 'IconsaxPlusBroken': {
    //   'packagePath': 'packages/iconsax_plus/fonts',
    //   'variants': ['IconsaxPlusBroken.ttf'],
    // },
    // 'IconsaxPlusLinear': {
    //   'packagePath': 'packages/iconsax_plus/fonts',
    //   'variants': ['IconsaxPlusLinear.ttf'],
    // },
  };
  static Future<void> loadFonts() async {
    final loadingTasks = <Future<void>>[];

    for (final entry in _fontConfigs.entries) {
      final fontFamily = entry.key;
      final config = entry.value as Map<String, dynamic>;
      final variants = config['variants'] as List<String>;

      // Check if this font uses a custom package path (external package)
      final packagePath = config['packagePath'] as String?;
      final basePath = config['basePath'] as String?;

      loadingTasks.add(
        _loadFontFamily(fontFamily, variants, packagePath, basePath),
      );
    }
    await Future.wait(loadingTasks);
  }

  static Future<void> _loadFontFamily(
    String fontFamily,
    List<String> variants,
    String? packagePath,
    String? basePath,
  ) async {
    final fontLoader = FontLoader(fontFamily);
    var loadedVariants = 0;

    for (final variant in variants) {
      final String fontPath;
      if (packagePath != null) {
        // External package font
        fontPath = '$packagePath/$variant';
      } else if (basePath != null) {
        // Local package font
        fontPath = '$_packagePath/$basePath/$variant';
      } else {
        throw Exception(
          'Font configuration must have either packagePath or basePath',
        );
      }

      try {
        final byteData = await rootBundle.load(fontPath);
        fontLoader.addFont(Future.value(byteData));
        loadedVariants++;
      } catch (error) {
        developer.log(
          'UI Design System: Skipping missing font asset "$fontPath" for family "$fontFamily": $error',
        );
      }
    }

    if (loadedVariants == 0) {
      developer.log(
        'UI Design System: No variants were loaded for "$fontFamily".',
      );
      return;
    }

    await fontLoader.load();
  }

  static Future<void> loadCocogooseFonts() async {
    final config = _getConfigOrThrow('Cocogoose');
    await _loadFontFamily(
      'Cocogoose',
      config['variants'] as List<String>,
      config['packagePath'] as String?,
      config['basePath'] as String?,
    );
  }

  static Future<void> loadLemonMilkFonts() async {
    final config = _getConfigOrThrow('LemonMilk');
    await _loadFontFamily(
      'LemonMilk',
      config['variants'] as List<String>,
      config['packagePath'] as String?,
      config['basePath'] as String?,
    );
  }

  static Future<void> loadCairoFonts() async {
    final config = _getConfigOrThrow('Cairo');
    await _loadFontFamily(
      'Cairo',
      config['variants'] as List<String>,
      config['packagePath'] as String?,
      config['basePath'] as String?,
    );
  }

  static Future<void> loadIconsaxPlusFonts() async {
    final boldConfig = _getConfigOrThrow('IconsaxPlusBold');
    await _loadFontFamily(
      'IconsaxPlusBold',
      boldConfig['variants'] as List<String>,
      boldConfig['packagePath'] as String?,
      null,
    );

    final brokenConfig = _getConfigOrThrow('IconsaxPlusBroken');
    await _loadFontFamily(
      'IconsaxPlusBroken',
      brokenConfig['variants'] as List<String>,
      brokenConfig['packagePath'] as String?,
      null,
    );

    final linearConfig = _getConfigOrThrow('IconsaxPlusLinear');
    await _loadFontFamily(
      'IconsaxPlusLinear',
      linearConfig['variants'] as List<String>,
      linearConfig['packagePath'] as String?,
      null,
    );
  }

  static Map<String, dynamic> _getConfigOrThrow(String fontFamily) {
    final config = _fontConfigs[fontFamily];
    if (config is Map<String, dynamic>) {
      return config;
    }
    throw StateError('Font "$fontFamily" is not configured in UIFontLoader.');
  }

  static List<String> get availableFontFamilies => _fontConfigs.keys.toList();

  static List<String>? getFontVariants(String fontFamily) {
    final config = _fontConfigs[fontFamily];
    return config != null ? config['variants'] as List<String>? : null;
  }
}
