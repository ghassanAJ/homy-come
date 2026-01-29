import 'package:flutter/material.dart';

import '../../tokens/colors.dart';
import '../../ui.dart';

/// Represents a single option in the selector
///
/// Generic class that holds the value, label, and optional icon for an option.
class SelectorOption<T> {
  /// The value associated with this option
  final T value;

  /// The display label for this option
  final String label;

  /// Optional icon to display before the label
  final IconData? icon;

  const SelectorOption({required this.value, required this.label, this.icon});
}

/// A two-option horizontal selector component
///
/// Creates a horizontal selector with two mutually exclusive options.
/// The first option has rounded corners on the left, and the second
/// option has rounded corners on the right, creating a unified appearance.
///
/// **Design Pattern:**
/// - First option (left): Uses tertiary color (#6adbda) when selected, white text
/// - Second option (right): Uses secondary color (#e3daff) when selected, primary text
/// - Unselected: White background, primary dark text
///
/// Features:
/// - Generic type support for any value type
/// - Optional icons for each option
/// - Automatic color assignment based on position
/// - Follows design system tokens
///
/// Example:
/// ```dart
/// enum UserType { parent, child }
///
/// OptionSelector<UserType>(
///   options: [
///     SelectorOption(
///       value: UserType.parent,
///       label: 'Parent',
///       icon: Icons.person,
///     ),
///     SelectorOption(
///       value: UserType.child,
///       label: 'Child',
///       icon: Icons.child_care,
///     ),
///   ],
///   selectedValue: UserType.parent,
///   onChanged: (value) => print('Selected: $value'),
/// )
/// ```
class OptionSelector<T> extends StatefulWidget {
  /// The two options to display (must be exactly 2)
  final List<SelectorOption<T>> options;

  /// The currently selected value
  final T selectedValue;

  /// Callback when selection changes
  final ValueChanged<T> onChanged;

  const OptionSelector({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  }) : assert(options.length == 2, 'OptionSelector requires exactly 2 options');

  @override
  State<OptionSelector<T>> createState() => _OptionSelectorState<T>();
}

class _OptionSelectorState<T> extends State<OptionSelector<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // First option - rounded left corners, uses tertiary color when selected
          Expanded(
            child: _buildOption(
              option: widget.options[0],
              isSelected: _selectedValue == widget.options[0].value,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
              selectedColor: UIColor.tertiary, // #6adbda
              selectedTextColor: UIColor.neutral000, // white
              unselectedColor: UIColor.neutral000, // white
              unselectedTextColor: UIColor.primaryDark, // #2b2148
            ),
          ),

          // Second option - rounded right corners, uses secondary color when selected
          Expanded(
            child: _buildOption(
              option: widget.options[1],
              isSelected: _selectedValue == widget.options[1].value,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              selectedColor: UIColor.secondary, // #e3daff
              selectedTextColor: UIColor.primary, // #6b55ef
              unselectedColor: UIColor.neutral000, // white
              unselectedTextColor: UIColor.primaryDark, // #2b2148
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required SelectorOption<T> option,
    required bool isSelected,
    required BorderRadius borderRadius,
    required Color selectedColor,
    required Color selectedTextColor,
    required Color unselectedColor,
    required Color unselectedTextColor,
  }) {
    final backgroundColor = isSelected ? selectedColor : unselectedColor;
    final textColor = isSelected ? selectedTextColor : unselectedTextColor;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedValue = option.value;
        });
        widget.onChanged(option.value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (option.icon != null) ...[
              Icon(option.icon, size: 24, color: textColor),
              const SizedBox(width: 8),
            ],
            Text(
              option.label,
              style: UI.text.bodySmall.copyWith(
                color: textColor,
                height: 1.0, // Match Figma design (line-height: normal)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
