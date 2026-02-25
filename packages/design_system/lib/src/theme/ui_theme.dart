import 'package:design_system/design_system.dart';

import 'design_model_loader.dart';
import 'models/theme_model.dart';

/// MDTheme provides access to the design system's color palette
/// for consistent theming across the application
class UITheme {
  static final UITheme _instance = UITheme._internal();
  static bool _initialized = false;

  // Cache for colors to avoid repetitive hex-to-color conversions
  final Map<String, Color> _colorCache = {};

  ThemePalette? _currentPalette;
  String _currentThemeName = 'default';

  /// Factory constructor that returns the singleton instance
  factory UITheme() {
    return _instance;
  }

  UITheme._internal();

  /// Static access to theme styles
  ///
  /// Example usage:
  /// ```dart
  /// Container(color: MDTheme.styles.p1Color);
  /// ```
  static final styles = _MDThemeStyles._();

  /// Initializes the theme system
  /// This must be called before using any theme methods
  /// Typically called during app initialization
  static Future<void> initialize() async {
    if (_initialized) return;
    await _instance._loadTheme();
    _initialized = true;
  }

  /// Checks if theme has been initialized
  static bool get isInitialized => _initialized;

  /// Loads theme data from design tokens using DesignConfigLoader
  Future<void> _loadTheme() async {
    // Use DesignConfigLoader to get the theme section from embedded tokens
    final Map<String, dynamic> themeData = await DesignConfigLoader()
        .getConfigSection('theme');

    // Using the default theme by default
    final Map<String, dynamic> defaultTheme = themeData['default'];

    _currentPalette = ThemePalette(
      primary: PrimaryColors(
        p1: defaultTheme['primary']['p1'],
        p2: defaultTheme['primary']['p2'],
        p3: defaultTheme['primary']['p3'],
      ),
      secondary: SecondaryColors(
        s1: defaultTheme['secondary']['s1'],
        s2: defaultTheme['secondary']['s2'],
      ),
      shade: GreyColors(
        shade800: defaultTheme['shade']['800'],
        shade600: defaultTheme['shade']['600'],
        shade500: defaultTheme['shade']['500'],
        shade400: defaultTheme['shade']['400'],
        shade300: defaultTheme['shade']['300'],
        shade200: defaultTheme['shade']['200'],
        shade100: defaultTheme['shade']['100'],
        shade000: defaultTheme['shade']['000'],
      ),
      system: SystemColors(
        error: defaultTheme['system']['error'],
        success: defaultTheme['system']['success'],
        warning: defaultTheme['system']['warning'],
      ),
    );

    // Pre-cache all colors
    _precacheColors();
  }

  /// Pre-caches all colors for immediate access
  void _precacheColors() {
    // Primary colors
    _cacheColor('p1', _currentPalette!.primary.p1);
    _cacheColor('p2', _currentPalette!.primary.p2);
    _cacheColor('p3', _currentPalette!.primary.p3);

    // Secondary colors
    _cacheColor('s1', _currentPalette!.secondary.s1);
    _cacheColor('s2', _currentPalette!.secondary.s2);

    // Shades
    _cacheColor('shade800', _currentPalette!.shade.shade800);
    _cacheColor('shade600', _currentPalette!.shade.shade600);
    _cacheColor('shade500', _currentPalette!.shade.shade500);
    _cacheColor('shade400', _currentPalette!.shade.shade400);
    _cacheColor('shade300', _currentPalette!.shade.shade300);
    _cacheColor('shade200', _currentPalette!.shade.shade200);
    _cacheColor('shade100', _currentPalette!.shade.shade100);
    _cacheColor('shade000', _currentPalette!.shade.shade000);

    // System colors
    _cacheColor('error', _currentPalette!.system.error);
    _cacheColor('success', _currentPalette!.system.success);
    _cacheColor('warning', _currentPalette!.system.warning);
  }

  /// Cache a specific color
  void _cacheColor(String key, String hexValue) {
    _colorCache[key] = ColorValue(hexValue: hexValue).color;
  }

  /// Changes the active theme
  Future<void> setTheme(String themeName) async {
    _checkInitialized();

    // Use DesignConfigLoader to get the theme section from embedded tokens
    final Map<String, dynamic> themeData = await DesignConfigLoader()
        .getConfigSection('theme');

    if (!themeData.containsKey(themeName)) {
      throw Exception('Theme $themeName not found');
    }

    final Map<String, dynamic> selectedTheme = themeData[themeName];

    _currentPalette = ThemePalette(
      primary: PrimaryColors(
        p1: selectedTheme['primary']['p1'],
        p2: selectedTheme['primary']['p2'],
        p3: selectedTheme['primary']['p3'],
      ),
      secondary: SecondaryColors(
        s1: selectedTheme['secondary']['s1'],
        s2: selectedTheme['secondary']['s2'],
      ),
      shade: GreyColors(
        shade800: selectedTheme['shade']['800'],
        shade600: selectedTheme['shade']['600'],
        shade500: selectedTheme['shade']['500'],
        shade400: selectedTheme['shade']['400'],
        shade300: selectedTheme['shade']['300'],
        shade200: selectedTheme['shade']['200'],
        shade100: selectedTheme['shade']['100'],
        shade000: selectedTheme['shade']['000'],
      ),
      system: SystemColors(
        error: selectedTheme['system']['error'],
        success: selectedTheme['system']['success'],
        warning: selectedTheme['system']['warning'],
      ),
    );

    _currentThemeName = themeName;

    // Clear and re-cache colors with the new theme
    _colorCache.clear();
    _precacheColors();
  }

  /// Check initialization state and throw if not initialized
  void _checkInitialized() {
    if (!_initialized) {
      throw StateError(
        'MDTheme not initialized. Call MDTheme.initialize() before using theme methods.',
      );
    }
  }

  /// Gets the current theme name
  String get currentThemeName {
    _checkInitialized();
    return _currentThemeName;
  }

  /// Gets the current theme palette
  ThemePalette get palette {
    _checkInitialized();
    return _currentPalette!;
  }

  /// Gets primary color - majorelleBlue
  /// Use static property: MDTheme.styles.p1Color
  Color p1Color() {
    _checkInitialized();
    return _colorCache['p1']!;
  }

  /// Gets secondary color - crayola
  /// Use static property: MDTheme.styles.p2Color
  Color p2Color() {
    _checkInitialized();
    return _colorCache['p2']!;
  }

  /// Gets accent color - russianViolet
  /// Use static property: MDTheme.styles.p3Color
  Color p3Color() {
    _checkInitialized();
    return _colorCache['p3']!;
  }

  /// Gets maize color
  /// Use static property: MDTheme.styles.s1Color
  Color s1Color() {
    _checkInitialized();
    return _colorCache['s1']!;
  }

  /// Gets sunset orange color
  /// Use static property: MDTheme.styles.s2Color
  Color s2Color() {
    _checkInitialized();
    return _colorCache['s2']!;
  }

  /// Gets grey color by variant
  /// Use static method: MDTheme.styles.shadeColor(variant)
  Color shadeColor(String variant) {
    _checkInitialized();

    switch (variant) {
      case '800':
        return _colorCache['shade800']!;
      case '600':
        return _colorCache['shade600']!;
      case '500':
        return _colorCache['shade500']!;
      case '400':
        return _colorCache['shade400']!;
      case '300':
        return _colorCache['shade300']!;
      case '200':
        return _colorCache['shade200']!;
      case '100':
        return _colorCache['shade100']!;
      case '000':
        return _colorCache['shade000']!;
      default:
        throw Exception('Grey variant $variant not found');
    }
  }

  /// Gets error color
  /// Use static property: MDTheme.styles.errorColor
  Color errorColor() {
    _checkInitialized();
    return _colorCache['error']!;
  }

  /// Gets success color
  /// Use static property: MDTheme.styles.successColor
  Color successColor() {
    _checkInitialized();
    return _colorCache['success']!;
  }

  /// Gets warning color
  /// Use static property: MDTheme.styles.warningColor
  Color warningColor() {
    _checkInitialized();
    return _colorCache['warning']!;
  }

  /// Creates a Flutter ThemeData based on the design system
  /// Use static method: MDTheme.styles.createThemeData()
  ThemeData createThemeData() {
    _checkInitialized();

    // Always use LemonMilk as the default font for the theme
    // Specific components like headings will use their own fonts
    const String defaultFontFamily = 'LemonMilk';

    return ThemeData(
      scaffoldBackgroundColor: UITheme.styles.backgroundColor,
      primaryColor: p1Color(),
      // Set LemonMilk as the default font family for the entire theme
      fontFamily: defaultFontFamily,
      colorScheme: ColorScheme(
        primary: p1Color(),
        onPrimary: shadeColor('000'),
        secondary: s1Color(),
        onSecondary: shadeColor('800'),
        surface: shadeColor('100'),
        onSurface: shadeColor('800'),
        surfaceBright: shadeColor('100'),
        surfaceDim: shadeColor('800'),
        error: errorColor(),
        onError: shadeColor('000'),
        brightness: Brightness.light,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: p1Color(),
        foregroundColor: shadeColor('000'),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(p1Color()),
          foregroundColor: WidgetStateProperty.all(shadeColor('000')),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(foregroundColor: WidgetStateProperty.all(p1Color())),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(p1Color()),
          side: WidgetStateProperty.all(BorderSide(color: p1Color())),
        ),
      ),
      cardTheme: CardThemeData(color: shadeColor('000')),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: shadeColor('300'), fontSize: 16),
      ),
    );
  }
}

/// Static accessor class for theme styles
///
/// This allows accessing theme styles as static properties:
/// ```dart
/// Text('Hello', style: TextStyle(color: MDTheme.styles.p1Color));
/// ```
class _MDThemeStyles {
  const _MDThemeStyles._();

  /// Access to primary color (majorelleBlue)
  Color get p1Color {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['p1']!;
  }

  /// Access to secondary color (crayola)
  Color get p2Color {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['p2']!;
  }

  /// Access to accent color (russianViolet)
  Color get p3Color {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['p3']!;
  }

  /// Access to maize color
  Color get s1Color {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['s1']!;
  }

  /// Access to sunset orange color
  Color get s2Color {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['s2']!;
  }

  /// Access to error color
  Color get errorColor {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['error']!;
  }

  /// Access to success color
  Color get successColor {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['success']!;
  }

  /// Access to warning color
  Color get warningColor {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['warning']!;
  }

  /// Access to shadeColor method
  Color shadeColor(String variant) {
    UITheme._instance._checkInitialized();
    switch (variant) {
      case '800':
        return UITheme._instance._colorCache['shade800']!;
      case '600':
        return UITheme._instance._colorCache['shade600']!;
      case '500':
        return UITheme._instance._colorCache['shade500']!;
      case '400':
        return UITheme._instance._colorCache['shade400']!;
      case '300':
        return UITheme._instance._colorCache['shade300']!;
      case '200':
        return UITheme._instance._colorCache['shade200']!;
      case '100':
        return UITheme._instance._colorCache['shade100']!;
      case '000':
        return UITheme._instance._colorCache['shade000']!;
      default:
        throw Exception('Grey variant $variant not found');
    }
  }

  /// Create a Flutter ThemeData from the design system
  ThemeData createThemeData() {
    return UITheme._instance.createThemeData();
  }

  /// Access to shade800 color directly
  Color get shade800 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade800']!;
  }

  /// Access to shade600 color directly
  Color get shade600 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade600']!;
  }

  /// Access to shade500 color directly
  Color get shade500 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade500']!;
  }

  /// Access to shade400 color directly
  Color get shade400 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade400']!;
  }

  /// Access to shade300 color directly
  Color get shade300 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade300']!;
  }

  /// Access to shade200 color directly
  Color get shade200 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade200']!;
  }

  /// Access to shade100 color directly
  Color get shade100 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade100']!;
  }

  /// Access to shade000 color directly
  Color get shade000 {
    UITheme._instance._checkInitialized();
    return UITheme._instance._colorCache['shade000']!;
  }

  Color get backgroundColor {
    return Color(0xffF6F4FF);
  }

  Color get secondaryColor {
    return Color(0xFFE3DAFF);
  }

  Color get onPrimaryColor {
    return Color(0xFFFFFFFF);
  }
}
