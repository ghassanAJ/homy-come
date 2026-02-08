import '../../tokens/colors.dart';
import 'package:flutter/material.dart';
import '../../ui.dart';

/// Shared utilities for input field widgets
///
/// Provides reusable components and logic for text fields, phone fields,
/// date fields, and other input widgets to eliminate code duplication.
class InputUtils {
  InputUtils._();

  // ===========================================================================
  // STATUS ICONS
  // ===========================================================================

  /// Builds a default success icon (green checkmark in circle)
  ///
  /// Used in text fields and phone fields to indicate valid input.
  static Widget buildSuccessIcon() {
    return Container(
      width: UI.sizes.statusIconContainer,
      height: UI.sizes.statusIconContainer,
      decoration: BoxDecoration(
        color: UIColor.success,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: UI.sizes.statusIcon,
      ),
    );
  }

  /// Builds a clear/error icon (red X in circle)
  ///
  /// Used in text fields and phone fields to clear invalid input.
  static Widget buildClearIcon() {
    return Container(
      width: UI.sizes.statusIconContainer,
      height: UI.sizes.statusIconContainer,
      decoration: BoxDecoration(
        color: UIColor.error,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.close,
        color: Colors.white,
        size: UI.sizes.statusIcon,
      ),
    );
  }

  // ===========================================================================
  // BORDER COLOR LOGIC
  // ===========================================================================

  /// Determines the border color based on field state
  ///
  /// Handles enabled/disabled, error, and focus states consistently
  /// across all input widgets.
  ///
  /// Parameters:
  /// - [enabled]: Whether the field is enabled
  /// - [hasError]: Whether the field has an error
  /// - [isFocused]: Whether the field is currently focused
  ///
  /// Returns the appropriate border color for the current state.
  static Color getBorderColor({
    required bool enabled,
    required bool hasError,
    required bool isFocused,
  }) {
    if (!enabled) {
      return UIColor.border;
    }
    if (hasError) {
      return UIColor.borderError;
    }
    if (isFocused) {
      return UIColor.borderFocused;
    }
    return UIColor.border;
  }

  // ===========================================================================
  // INPUT DECORATION BUILDERS
  // ===========================================================================

  /// Creates a consistent InputDecoration for text-based input fields
  ///
  /// Provides standard styling for borders, colors, padding, and states
  /// following the design system specifications.
  ///
  /// Parameters:
  /// - [placeholder]: Hint text to display
  /// - [borderColor]: Current border color based on state
  /// - [prefixIcon]: Optional prefix icon widget
  /// - [suffixIcon]: Optional suffix icon widget
  ///
  /// Returns a fully configured InputDecoration.
  static InputDecoration buildInputDecoration({
    String? placeholder,
    required Color borderColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: placeholder,
      hintStyle: UI.text.inputPlaceholder.copyWith(
        color: UIColor.textPlaceholder,
      ),
      filled: true,
      fillColor: UIColor.surface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: prefixIcon != null ? 8 : UI.spacing.inputHorizontal,
        vertical: UI.spacing.inputVertical,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(
          color: borderColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.borderError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.borderError, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UI.radius.input),
        borderSide: BorderSide(color: UIColor.border),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      counterText: '',
    );
  }

  // ===========================================================================
  // SHADOW CONTAINER BUILDERS
  // ===========================================================================

  /// Builds an animated container with input field shadows
  ///
  /// Provides consistent shadow behavior across input widgets based on
  /// focus and error states.
  ///
  /// Parameters:
  /// - [child]: The widget to wrap (typically a TextField)
  /// - [isFocused]: Whether the field is focused
  /// - [hasError]: Whether the field has an error
  ///
  /// Returns a decorated container with appropriate shadows.
  static Widget buildShadowContainer({
    required Widget child,
    required bool isFocused,
    required bool hasError,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UI.radius.input),
        boxShadow: !hasError
            ? (isFocused ? UI.shadows.inputFocused : UI.shadows.input)
            : null,
      ),
      child: child,
    );
  }

  // ===========================================================================
  // LABEL BUILDERS
  // ===========================================================================

  /// Builds a consistent label for input fields
  ///
  /// Parameters:
  /// - [label]: The label text to display
  ///
  /// Returns a Text widget styled according to design system.
  static Widget buildLabel(String label) {
    return Text(
      label,
      style: UI.text.fieldLabel.copyWith(color: UIColor.primaryDark),
    );
  }

  // ===========================================================================
  // ERROR/HELPER TEXT BUILDERS
  // ===========================================================================

  /// Builds error text display
  ///
  /// Parameters:
  /// - [error]: The error message to display
  ///
  /// Returns a Text widget with error styling.
  static Widget buildErrorText(String error) {
    return Text(
      error,
      style: UI.text.inputError.copyWith(color: UIColor.error),
    );
  }

  /// Builds helper text display
  ///
  /// Parameters:
  /// - [helperText]: The helper message to display
  ///
  /// Returns a Text widget with helper styling.
  static Widget buildHelperText(String helperText) {
    return Text(
      helperText,
      style: UI.text.inputPlaceholder.copyWith(
        color: UIColor.textSecondary,
      ),
    );
  }
}
