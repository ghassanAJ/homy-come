import 'tokens/typography.dart';
import 'tokens/spacing.dart';
import 'tokens/padding.dart';
import 'tokens/radius.dart';
import 'tokens/shadows.dart';
import 'tokens/sizes.dart';

/// Main design system namespace
///
/// Access all design tokens through this class:
/// - `UIColor.primary` - Color tokens
/// - `UI.text.h1()` - Typography tokens
/// - `UI.spacing.md` - Spacing tokens
/// - `UI.radius.lg` - Border radius tokens
/// - `UI.shadows.sm` - Shadow tokens
/// - `UI.sizes.iconMd` - Size tokens
///
/// Example:
/// ```dart
/// Container(
///   padding: EdgeInsets.all(UI.spacing.md),
///   decoration: BoxDecoration(
///     color: UIColor.primary,
///     borderRadius: BorderRadius.circular(UI.radius.lg),
///     boxShadow: UI.shadows.sm,
///   ),
///   child: Text(
///     'Hello',
///     style: UI.text.h1().copyWith(color: UIColor.onPrimary),
///   ),
/// )
/// ```
class UI {
  // Private constructor to prevent instantiation
  UI._();

  /// Typography tokens
  ///
  /// Access text styles via `UI.text.h1()`, `UI.text.h2()`, `UI.text.bodyMedium`, etc.
  static const text = UITypography();

  /// Spacing tokens
  ///
  /// Access spacing values via `UI.spacing.md`, `UI.spacing.lg`, etc.
  static const spacing = UISpacing();

  /// Padding tokens
  ///
  /// Access common paddings via `UI.padding.authScrollable`, `UI.padding.authActions`, etc.
  static const padding = UIPadding();

  /// Border radius tokens
  ///
  /// Access radius values via `UI.radius.lg`, `UI.radius.md`, etc.
  static const radius = UIRadius();

  /// Shadow tokens
  ///
  /// Access shadow styles via `UI.shadows.sm`, `UI.shadows.md`, etc.
  static const shadows = UIShadows();

  /// Size tokens
  ///
  /// Access size values via `UI.sizes.iconMd`, `UI.sizes.inputHeight`, etc.
  static const sizes = UISizes();
}
