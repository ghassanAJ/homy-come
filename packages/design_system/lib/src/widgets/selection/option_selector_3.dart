import '../../tokens/colors.dart';
import 'package:flutter/material.dart';
import '../../ui.dart';
import 'option_selector.dart';

/// A three-option horizontal selector component
///
/// Creates a horizontal selector with three mutually exclusive options.
/// All options have equal width and are contained within a rounded container.
///
/// This variant is simpler than [OptionSelector] and doesn't support icons,
/// focusing on text-only labels for a clean, minimal appearance.
///
/// Features:
/// - Generic type support for any value type
/// - Equal-width options
/// - Container with background and padding
/// - Follows design system tokens
///
/// Example:
/// ```dart
/// enum Frequency { daily, weekly, once }
///
/// OptionSelector3<Frequency>(
///   options: [
///     SelectorOption(value: Frequency.daily, label: 'Daily'),
///     SelectorOption(value: Frequency.weekly, label: 'Weekly'),
///     SelectorOption(value: Frequency.once, label: 'Once'),
///   ],
///   selectedValue: Frequency.weekly,
///   onChanged: (value) => print('Selected: $value'),
/// )
/// ```
class OptionSelector3<T> extends StatelessWidget {
  /// The three options to display (must be exactly 3)
  final List<SelectorOption<T>> options;

  /// The currently selected value
  final T selectedValue;

  /// Callback when selection changes
  final ValueChanged<T> onChanged;

  /// Background color for the selected option
  /// Defaults to secondary color (light purple)
  final Color? selectedColor;

  /// Text color for selected and unselected options
  /// Defaults to primary dark color
  final Color? textColor;

  /// Container background color
  /// Defaults to white
  final Color? containerColor;

  const OptionSelector3({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.selectedColor,
    this.textColor,
    this.containerColor,
  }) : assert(
            options.length == 3, 'OptionSelector3 requires exactly 3 options');

  @override
  Widget build(BuildContext context) {
    final effectiveSelectedColor = selectedColor ?? UIColor.secondary;
    final effectiveTextColor = textColor ?? UIColor.primaryDark;
    final effectiveContainerColor = containerColor ?? UIColor.neutral000;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: effectiveContainerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) {
          final isSelected = selectedValue == option.value;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(option.value),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color:
                      isSelected ? effectiveSelectedColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    option.label,
                    style: UI.text.bodySmall.copyWith(
                      color: effectiveTextColor,
                      height: 1.43, // 20px line height / 14px font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
