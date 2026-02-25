import 'package:flutter/material.dart';

/// Utility class that handles typography scaling based on device settings
/// This ensures text remains readable regardless of user font size preferences
class TypographyScaling {
  static TypographyScaling? _instance;
  
  /// Baseline scale factor that represents standard scaling (1.0)
  /// This is used as a reference point for scaling calculations
  static const double _baselineScaleFactor = 1.0;
  
  /// Minimum scale factor to prevent text from becoming too small
  static const double _minScaleFactor = 0.8;
  
  /// Maximum scale factor to prevent text from becoming excessively large
  static const double _maxScaleFactor = 2.5;
  
  /// Default DPI that designs are typically created for
  static const double _referenceDpi = 160.0; // mdpi baseline
  
  /// Holds the current text scale factor from the device settings
  double _textScaleFactor = 1.0;
  
  /// Holds the current device pixel ratio for DPI calculations
  double _devicePixelRatio = 1.0;
  
  /// Optional weight to apply to user text scale factor (0.0-1.0)
  /// At 1.0, the app fully respects the user's accessibility settings
  /// At 0.0, the app ignores the user's settings (not recommended)
  double _textScaleWeight = 0.8;
  
  /// Returns the singleton instance of TypographyScaling
  factory TypographyScaling() {
    _instance ??= TypographyScaling._internal();
    return _instance!;
  }
  
  TypographyScaling._internal();
  
  /// Static access to typography scaling methods
  /// 
  /// Example usage:
  /// ```dart
  /// final scaledStyle = TypographyScaling.styles.scaleTextStyle(myStyle);
  /// ```
  static final styles = _TypographyScalingStyles._();
  
  /// Updates the scaling parameters based on the current MediaQuery data
  /// This should be called when the app starts and when the settings change
  /// Use static method: TypographyScaling.styles.updateScalingFromMediaQuery(mediaQuery)
  void updateScalingFromMediaQuery(MediaQueryData mediaQuery) {
    _textScaleFactor = mediaQuery.textScaleFactor;
    _devicePixelRatio = mediaQuery.devicePixelRatio;
  }
  
  /// Updates the scaling parameters based on a BuildContext
  /// Convenience method to extract MediaQueryData from the context
  /// Use static method: TypographyScaling.styles.updateScalingFromContext(context)
  void updateScalingFromContext(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    updateScalingFromMediaQuery(mediaQuery);
  }
  
  /// Sets the weight applied to the user's text scale preference
  /// Value must be between 0.0 and 1.0
  /// Use static method: TypographyScaling.styles.setTextScaleWeight(weight)
  void setTextScaleWeight(double weight) {
    assert(weight >= 0.0 && weight <= 1.0, 'Text scale weight must be between 0.0 and 1.0');
    _textScaleWeight = weight;
  }
  
  /// Gets the current text scale factor from device settings
  double get textScaleFactor => _textScaleFactor;
  
  /// Gets the current device pixel ratio
  double get devicePixelRatio => _devicePixelRatio;
  
  /// Calculates the actual scale factor to apply to typography
  /// This formula balances design intent with accessibility needs
  double get calculatedScaleFactor {
    // Apply the weight to the user's text scale factor
    final weightedScale = 1.0 + ((_textScaleFactor - _baselineScaleFactor) * _textScaleWeight);
    
    // Apply DPI adjustment (subtle adjustment based on device density)
    // This makes fonts slightly larger on high DPI devices for better readability
    final dpiAdjustment = (_devicePixelRatio / (_referenceDpi / 100)) * 0.05;
    
    // Combine the weighted scale with the DPI adjustment
    final combinedScale = weightedScale + dpiAdjustment;
    
    // Ensure the scale factor stays within reasonable bounds
    return combinedScale.clamp(_minScaleFactor, _maxScaleFactor);
  }
  
  /// Scales a specific font size according to the formula
  /// Use static method: TypographyScaling.styles.scaleFont(fontSize)
  double scaleFont(double fontSize) {
    return fontSize * calculatedScaleFactor;
  }
  
  /// Scales a text style's font size while preserving all other properties
  /// Use static method: TypographyScaling.styles.scaleTextStyle(style)
  TextStyle scaleTextStyle(TextStyle style) {
    // Only scale the font size, preserving all other style properties
    return style.copyWith(
      fontSize: style.fontSize != null 
          ? scaleFont(style.fontSize!) 
          : null,
    );
  }
}

/// Static accessor class for typography scaling methods
/// 
/// This allows accessing typography scaling methods as static properties:
/// ```dart
/// final scaledStyle = TypographyScaling.styles.scaleTextStyle(myStyle);
/// ```
class _TypographyScalingStyles {
  const _TypographyScalingStyles._();
  
  /// Updates the scaling parameters based on the current MediaQuery data
  /// This should be called when the app starts and when the settings change
  void updateScalingFromMediaQuery(MediaQueryData mediaQuery) {
    _getInstance().updateScalingFromMediaQuery(mediaQuery);
  }
  
  /// Updates the scaling parameters based on a BuildContext
  /// Convenience method to extract MediaQueryData from the context
  void updateScalingFromContext(BuildContext context) {
    _getInstance().updateScalingFromContext(context);
  }
  
  /// Sets the weight applied to the user's text scale preference
  /// Value must be between 0.0 and 1.0
  void setTextScaleWeight(double weight) {
    _getInstance().setTextScaleWeight(weight);
  }
  
  /// Gets the current text scale factor from device settings
  double get textScaleFactor => _getInstance()._textScaleFactor;
  
  /// Gets the current device pixel ratio
  double get devicePixelRatio => _getInstance()._devicePixelRatio;
  
  /// Calculates the actual scale factor to apply to typography
  double get calculatedScaleFactor => _getInstance().calculatedScaleFactor;
  
  /// Scales a specific font size according to the formula
  double scaleFont(double fontSize) {
    return _getInstance().scaleFont(fontSize);
  }
  
  /// Scales a text style's font size while preserving all other properties
  TextStyle scaleTextStyle(TextStyle style) {
    return _getInstance().scaleTextStyle(style);
  }
  
  /// Helper method to get or create the singleton instance
  TypographyScaling _getInstance() {
    TypographyScaling._instance ??= TypographyScaling._internal();
    return TypographyScaling._instance!;
  }
}
