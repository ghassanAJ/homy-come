import 'package:flutter/material.dart';
import 'design_model_loader.dart';
import 'models/screen_model.dart';

/// Manages screen breakpoints from the design system
class UIScreen {
  static final UIScreen _instance = UIScreen._internal();
  static bool _initialized = false;

  factory UIScreen() => _instance;

  UIScreen._internal();

  // Screen breakpoints from the design tokens
  final Map<String, ScreenSize> _screenSizes = {};

  /// Static access to screen styles
  ///
  /// Example usage:
  /// ```dart
  /// if (MDScreen.styles.isSmall(width)) { ... }
  /// ```
  static final styles = _MDScreenStyles._();

  /// Initializes the screen system
  /// This must be called before using any screen methods
  /// Typically called during app initialization
  static Future<void> initialize() async {
    if (_initialized) return;
    await _instance._loadScreenSizes();
    _initialized = true;
  }

  /// Checks if screen has been initialized
  static bool get isInitialized => _initialized;

  /// Loads screen tokens from the design system
  Future<void> _loadScreenSizes() async {
    final screenSection = await DesignConfigLoader().getConfigSection(
      'screens',
    );

    // Process each screen size (sm, md, lg, xl)
    screenSection.forEach((sizeName, sizeData) {
      if (sizeData is Map<String, dynamic>) {
        _screenSizes[sizeName] = ScreenSize.fromJson(sizeData);
      }
    });
  }

  /// Check initialization state and throw if not initialized
  void _checkInitialized() {
    if (!_initialized) {
      throw StateError(
        'MDScreen not initialized. Call MDScreen.initialize() before using screen methods.',
      );
    }
  }

  /// Get small screen size
  /// Use static property: MDScreen.styles.sm
  ScreenSize get sm {
    _checkInitialized();
    return _screenSizes['sm'] ?? ScreenSize(minWidth: 0, maxWidth: 359);
  }

  /// Get medium screen size
  /// Use static property: MDScreen.styles.md
  ScreenSize get md {
    _checkInitialized();
    return _screenSizes['md'] ?? ScreenSize(minWidth: 360, maxWidth: 767);
  }

  /// Get large screen size
  /// Use static property: MDScreen.styles.lg
  ScreenSize get lg {
    _checkInitialized();
    return _screenSizes['lg'] ?? ScreenSize(minWidth: 768, maxWidth: 1023);
  }

  /// Get extra large screen size
  /// Use static property: MDScreen.styles.xl
  ScreenSize get xl {
    _checkInitialized();
    return _screenSizes['xl'] ?? ScreenSize(minWidth: 1024, maxWidth: 1440);
  }

  /// Get a specific screen size by name
  /// Use static method: MDScreen.styles.getScreenSize(name)
  ScreenSize? getScreenSize(String name) {
    _checkInitialized();
    return _screenSizes[name];
  }

  /// Determine which screen size a width falls into
  /// Use static method: MDScreen.styles.getScreenSizeForWidth(width)
  String getScreenSizeForWidth(double width) {
    _checkInitialized();

    for (final entry in _screenSizes.entries) {
      if (width >= entry.value.minWidth && width <= entry.value.maxWidth) {
        return entry.key;
      }
    }

    // Default to the largest size if width exceeds all defined sizes
    return 'xl';
  }

  /// Check if the current screen width is small
  /// Use static method: MDScreen.styles.isSmall(width)
  bool isSmall(double width) {
    return sm.isInRange(width);
  }

  /// Check if the current screen width is medium
  /// Use static method: MDScreen.styles.isMedium(width)
  bool isMedium(double width) {
    return md.isInRange(width);
  }

  /// Check if the current screen width is large
  /// Use static method: MDScreen.styles.isLarge(width)
  bool isLarge(double width) {
    return lg.isInRange(width);
  }

  /// Check if the current screen width is extra large
  /// Use static method: MDScreen.styles.isExtraLarge(width)
  bool isExtraLarge(double width) {
    return xl.isInRange(width);
  }

  /// Helper method to get the appropriate screen size based on MediaQuery
  /// Use static method: MDScreen.styles.getScreenSizeFromContext(context)
  String getScreenSizeFromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getScreenSizeForWidth(width);
  }
}

/// Static accessor class for screen styles
///
/// This allows accessing screen sizes and utilities as static properties:
/// ```dart
/// if (MDScreen.styles.isSmall(MediaQuery.of(context).size.width)) {
///   // Use small screen layout
/// }
/// ```
class _MDScreenStyles {
  const _MDScreenStyles._();

  /// Access to small screen size
  ScreenSize get sm {
    UIScreen._instance._checkInitialized();
    return UIScreen._instance._screenSizes['sm'] ??
        ScreenSize(minWidth: 0, maxWidth: 359);
  }

  /// Access to medium screen size
  ScreenSize get md {
    UIScreen._instance._checkInitialized();
    return UIScreen._instance._screenSizes['md'] ??
        ScreenSize(minWidth: 360, maxWidth: 767);
  }

  /// Access to large screen size
  ScreenSize get lg {
    UIScreen._instance._checkInitialized();
    return UIScreen._instance._screenSizes['lg'] ??
        ScreenSize(minWidth: 768, maxWidth: 1023);
  }

  /// Access to extra large screen size
  ScreenSize get xl {
    UIScreen._instance._checkInitialized();
    return UIScreen._instance._screenSizes['xl'] ??
        ScreenSize(minWidth: 1024, maxWidth: 1440);
  }

  /// Get a specific screen size by name
  ScreenSize? getScreenSize(String name) {
    UIScreen._instance._checkInitialized();
    return UIScreen._instance._screenSizes[name];
  }

  /// Determine which screen size a width falls into
  String getScreenSizeForWidth(double width) {
    return UIScreen._instance.getScreenSizeForWidth(width);
  }

  /// Check if the current screen width is small
  bool isSmall(double width) {
    return sm.isInRange(width);
  }

  /// Check if the current screen width is medium
  bool isMedium(double width) {
    return md.isInRange(width);
  }

  /// Check if the current screen width is large
  bool isLarge(double width) {
    return lg.isInRange(width);
  }

  /// Check if the current screen width is extra large
  bool isExtraLarge(double width) {
    return xl.isInRange(width);
  }

  /// Helper method to get the appropriate screen size based on MediaQuery
  String getScreenSizeFromContext(BuildContext context) {
    return UIScreen._instance.getScreenSizeFromContext(context);
  }
}
