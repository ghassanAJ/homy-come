import 'package:flutter/material.dart';
import 'colors.dart';

/// Shadow tokens for the design system
///
/// Access via: UI.shadows.sm
class UIShadows {
  const UIShadows();

  /// Small shadow - subtle elevation
  ///
  /// Usage: Cards, buttons
  List<BoxShadow> get sm => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          offset: const Offset(0, 4),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ];

  /// Medium shadow - moderate elevation
  ///
  /// Usage: Dropdowns, modals
  List<BoxShadow> get md => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          offset: const Offset(0, 4),
          blurRadius: 12,
          spreadRadius: 0,
        ),
      ];

  /// Large shadow - high elevation
  ///
  /// Usage: Dialogs, floating action buttons
  List<BoxShadow> get lg => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          offset: const Offset(0, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ];

  /// Input field shadow - default/resting state
  ///
  /// From Figma: Drop shadow
  /// - Color: #101828 at 5% opacity
  /// - X: 0, Y: 1
  /// - Blur: 2, Spread: 0
  ///
  /// Usage: Text input fields in default state
  /// Subtle shadow for visual depth
  List<BoxShadow> get input => [
        BoxShadow(
          color: UIColor.shadow.withValues(alpha: 0.05),
          offset: const Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 0,
        ),
      ];

  /// Input field shadow - focused state
  ///
  /// Usage: Text input fields when focused
  /// More prominent shadow for emphasis (enhanced from default)
  List<BoxShadow> get inputFocused => [
        BoxShadow(
          color: UIColor.shadow.withValues(alpha: 0.08),
          offset: const Offset(0, 2),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ];
}
