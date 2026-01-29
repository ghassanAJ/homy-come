import 'package:design_system/design_system.dart';

/// Abstract interface for creating AppBar action buttons.
///
/// This interface allows for dependency injection and easy mocking in tests.
/// Use [DefaultUIAppBarActions] for the standard implementation.
///
/// Example usage:
/// ```dart
/// final actionsFactory = DefaultUIAppBarActions();
/// UIAppBar(
///   leading: actionsFactory.backButton(context),
///   actions: [
///     actionsFactory.textAction('Save', onPressed: _handleSave),
///   ],
/// )
/// ```
abstract class UIAppBarActionsInterface {
  /// Creates a standard back button with an arrow-left icon.
  ///
  /// If [onPressed] is not provided, defaults to calling `Navigator.of(context).maybePop()`.
  Widget backButton(
    BuildContext context, {
    VoidCallback? onPressed,
    Color? color,
  });

  /// Creates a close button with a close icon.
  ///
  /// If [onPressed] is not provided, defaults to calling `Navigator.of(context).maybePop()`.
  Widget closeButton(
    BuildContext context, {
    VoidCallback? onPressed,
    Color? color,
  });

  /// Creates a text action button.
  Widget textAction(
    String text, {
    required VoidCallback onPressed,
    Color? color,
  });

  /// Creates an icon action button.
  Widget iconAction(
    IconData icon, {
    required VoidCallback onPressed,
    Color? color,
  });
}

/// Default implementation of [UIAppBarActionsInterface].
///
/// This class provides the standard button implementations for UIAppBar.
/// It can be easily replaced with a mock implementation for testing.
class DefaultUIAppBarActions implements UIAppBarActionsInterface {
  /// Creates a const instance of DefaultUIAppBarActions.
  const DefaultUIAppBarActions();

  @override
  Widget backButton(
    BuildContext context, {
    VoidCallback? onPressed,
    Color? color,
  }) {
    return UIButton.icon(
      svgAsset: 'assets/icons/arrow-left.svg',
      onPressed: onPressed ?? () => Navigator.of(context).maybePop(),
      color: UIColor.black,
    );
  }

  @override
  Widget closeButton(
    BuildContext context, {
    VoidCallback? onPressed,
    Color? color,
  }) {
    return UIButton.icon(
      svgAsset: 'assets/icons/close.svg',
      onPressed: onPressed ?? () => Navigator.of(context).maybePop(),
      color: color,
    );
  }

  @override
  Widget textAction(
    String text, {
    required VoidCallback onPressed,
    Color? color,
  }) {
    return UIButton.text(label: text, onPressed: onPressed);
  }

  @override
  Widget iconAction(
    IconData icon, {
    required VoidCallback onPressed,
    Color? color,
  }) {
    return UIButton.icon(icon: icon, onPressed: onPressed, color: color);
  }
}
