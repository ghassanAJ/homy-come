import 'package:flutter/material.dart';
import '../ui.dart';
import '../tokens/colors.dart';

/// Theme builder for the design system
///
/// Creates Flutter ThemeData configured with design tokens
class AppTheme {
  AppTheme._();

  // ===========================================================================
  // COLOR SCHEME
  // ===========================================================================

  /// Builds the color scheme for light theme
  static ColorScheme _buildLightColorScheme() {
    return ColorScheme.light(
      primary: UIColor.primary,
      onPrimary: UIColor.onPrimary,
      secondary: UIColor.secondary,
      error: UIColor.error,
      surface: UIColor.background,
      onSurface: UIColor.textPrimary,
    );
  }

  // =========================================== ================================
  // APP BAR THEME
  // ===========================================================================

  /// Builds the app bar theme
  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: UIColor.primary,
      foregroundColor: UIColor.onPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: UI.text.h3.copyWith(
        color: UIColor.onPrimary,
      ),
    );
  }

  // ===========================================================================
  // CARD THEME
  // ===========================================================================

  /// Builds the card theme
  static CardThemeData _buildCardTheme() {
    return CardThemeData(
      color: UIColor.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UI.radius.md),
      ),
      margin: EdgeInsets.zero,
    );
  }

  // ===========================================================================
  // BUTTON THEMES
  // ===========================================================================

  /// Builds the elevated button theme
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: UIColor.primary,
        foregroundColor: UIColor.onPrimary,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.buttonHorizontal,
          vertical: UI.spacing.buttonVertical,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UI.radius.button),
        ),
        textStyle: UI.text.buttonText,
      ),
    );
  }

  /// Builds the text button theme
  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: UIColor.primary,
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.buttonHorizontal,
          vertical: UI.spacing.buttonVertical,
        ),
        textStyle: UI.text.buttonText,
      ),
    );
  }

  /// Builds the outlined button theme
  static OutlinedButtonThemeData _buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: UIColor.primary,
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.buttonHorizontal,
          vertical: UI.spacing.buttonVertical,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UI.radius.button),
        ),
        side: BorderSide(color: UIColor.primary),
        textStyle: UI.text.buttonText,
      ),
    );
  }

  // ===========================================================================
  // INPUT DECORATION THEME
  // ===========================================================================

  /// Builds the input decoration theme
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: UIColor.surface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: UI.spacing.inputHorizontal,
        vertical: UI.spacing.inputVertical,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.borderError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.borderError, width: 2),
      ),
      hintStyle: UI.text.inputPlaceholder.copyWith(
        color: UIColor.textPlaceholder,
      ),
      labelStyle: UI.text.fieldLabel.copyWith(
        color: UIColor.textSecondary,
      ),
      errorStyle: UI.text.inputError.copyWith(
        color: UIColor.error,
      ),
    );
  }

  // ===========================================================================
  // TEXT THEME
  // ===========================================================================

  /// Builds the text theme
  static TextTheme _buildTextTheme() {
    return TextTheme(
      displayLarge: UI.text.h1,
      displayMedium: UI.text.h2,
      displaySmall: UI.text.h3,
      bodyLarge: UI.text.bodyMedium,
      bodyMedium: UI.text.bodySmall,
      bodySmall: UI.text.caption,
      labelLarge: UI.text.buttonText,
    );
  }

  // ===========================================================================
  // DIVIDER THEME
  // ===========================================================================

  /// Builds the divider theme
  static DividerThemeData _buildDividerTheme() {
    return DividerThemeData(
      color: UIColor.border,
      thickness: 1,
      space: 1,
    );
  }

  // ===========================================================================
  // ICON THEME
  // ===========================================================================

  /// Builds the icon theme
  static IconThemeData _buildIconTheme() {
    return IconThemeData(
      color: UIColor.textPrimary,
      size: UI.sizes.iconMd,
    );
  }

  // ===========================================================================
  // PUBLIC API
  // ===========================================================================

  /// Light theme
  ///
  /// Example:
  /// ```dart
  /// MaterialApp(
  ///   theme: AppTheme.light,
  /// )
  /// ```
  static ThemeData get light => ThemeData(
        // Use Cairo as default font
        fontFamily: 'Cairo',

        // Color scheme
        colorScheme: _buildLightColorScheme(),

        // Scaffold
        scaffoldBackgroundColor: UIColor.background,

        // App bar
        appBarTheme: _buildAppBarTheme(),

        // Card
        cardTheme: _buildCardTheme(),

        // Elevated button
        elevatedButtonTheme: _buildElevatedButtonTheme(),

        // Text button
        textButtonTheme: _buildTextButtonTheme(),

        // Outlined button
        outlinedButtonTheme: _buildOutlinedButtonTheme(),

        // Input decoration
        inputDecorationTheme: _buildInputDecorationTheme(),

        // Text theme
        textTheme: _buildTextTheme(),

        // Divider
        dividerTheme: _buildDividerTheme(),

        // Icon theme
        iconTheme: _buildIconTheme(),

        // Use Material 3
        useMaterial3: true,
      );

  /// Dark theme (placeholder for future implementation)
  ///
  /// Currently returns the light theme
  /// TODO: Implement dark theme with appropriate color tokens
  static ThemeData get dark => light;
}
