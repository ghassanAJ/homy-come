import 'package:flutter/widgets.dart';

import 'design_model_loader.dart';
import 'typography_scaling.dart';
import 'ui_font_loader.dart';
import 'ui_screen.dart';
import 'ui_theme.dart';
import 'ui_typography.dart';

/// Main class to initialize the entire Material Design System
class UIDesignSystemInitializer {
  /// A flag to track whether the design system has been initialized
  static bool _initialized = false;

  /// Default text scale weight to apply for typography scaling
  /// This controls how much the app respects user font size settings
  static double _defaultTextScaleWeight = 0.8;

  /// Updates the default text scale weight (0.0-1.0)
  /// This affects how much of the user's font size preference is applied
  /// - 1.0 = fully respect user settings
  /// - 0.0 = ignore user settings (not recommended for accessibility)
  static void setDefaultTextScaleWeight(double weight) {
    assert(
      weight >= 0.0 && weight <= 1.0,
      'Text scale weight must be between 0.0 and 1.0',
    );
    _defaultTextScaleWeight = weight;

    // Update the scaling system if already initialized
    if (_initialized) {
      TypographyScaling().setTextScaleWeight(weight);
    }
  }

  /// Returns the current default text scale weight
  static double get defaultTextScaleWeight => _defaultTextScaleWeight;

  /// Initializes the entire Material Design System in the correct order
  ///
  /// This single method handles:
  /// - Loading embedded design tokens
  /// - Loading custom fonts
  /// - Initializing typography
  /// - Initializing screen sizes
  /// - Initializing theme colors
  /// - Setting up typography scaling
  ///
  /// Example usage in your app:
  /// ```dart
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await MDDesignSystemInitializer.initialize();
  ///   runApp(MyApp());
  /// }
  /// ```
  static Future<void> initialize() async {
    if (_initialized) return;

    // Required for Flutter to work with async operations before runApp
    WidgetsFlutterBinding.ensureInitialized();

    try {
      // Step 1: Load design tokens (happens automatically when needed)
      final loader = DesignConfigLoader();
      final tokens = await loader.loadDesignConfig();
      debugPrint(
        "✅ UI Design System: Successfully loaded design tokens: ${tokens.length} sections",
      );

      // Step 2: Load custom fonts
      await UIFontLoader.loadFonts();
      debugPrint("✅ UI Design System: Successfully loaded fonts");

      // Step 3: Initialize typography system
      await UITypography.initialize();
      debugPrint("✅ UI Design System: Successfully initialized typography");

      // Step 4: Initialize screen system
      await UIScreen.initialize();
      debugPrint("✅ UI Design System: Successfully initialized screen sizes");

      // Step 5: Initialize theme system
      await UITheme.initialize();
      debugPrint("✅ UI Design System: Successfully initialized theme");

      // Step 6: Initialize typography scaling with default weight
      TypographyScaling().setTextScaleWeight(_defaultTextScaleWeight);
      debugPrint(
        "✅ UI Design System: Successfully initialized typography scaling",
      );

      _initialized = true;
      debugPrint("✅ UI Design System: Initialization complete!");
    } catch (e) {
      debugPrint("❌ UI Design System: Error during initialization: $e");
      rethrow; // Rethrow to let app handle initialization failures
    }
  }

  /// Checks if the design system has been completely initialized
  static bool get isInitialized => _initialized;
}
