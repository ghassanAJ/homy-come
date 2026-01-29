import '../../tokens/colors.dart';
import 'package:flutter/material.dart';
import '../../ui.dart';

/// Represents a day of the week
enum Weekday {
  sun('S', 'Sunday'),
  mon('M', 'Monday'),
  tue('T', 'Tuesday'),
  wed('W', 'Wednesday'),
  thu('T', 'Thursday'),
  fri('F', 'Friday'),
  sat('S', 'Saturday');

  /// Short single-letter label
  final String shortLabel;

  /// Full day name
  final String fullName;

  const Weekday(this.shortLabel, this.fullName);
}

/// A weekday selector component that supports both single and multi-select modes
///
/// Creates a horizontal grid of 7 day buttons (S, M, T, W, T, F, S) with
/// support for selecting single or multiple days.
///
/// **Design Pattern:**
/// - Selected: Light purple background (#e3daff), primary text (#6b55ef)
/// - Unselected: Light background (#f6f4ff), primary dark text (#2b2148)
/// - 4px gap between buttons, 48px height, 8px border radius
///
/// Features:
/// - Single-select mode: Select one day at a time (or none)
/// - Multi-select mode: Select multiple days simultaneously
/// - Follows design system tokens
/// - Matches Figma design exactly
///
/// Example (Multi-select):
/// ```dart
/// WeekdaySelector.multi(
///   selectedDays: {Weekday.wed, Weekday.sat},
///   onChanged: (days) => print('Selected: $days'),
/// )
/// ```
///
/// Example (Single-select):
/// ```dart
/// WeekdaySelector.single(
///   selectedDay: Weekday.wed,
///   onChanged: (day) => print('Selected: $day'),
/// )
/// ```
class WeekdaySelector extends StatelessWidget {
  /// Whether this is multi-select mode
  final bool isMultiSelect;

  /// Currently selected days (multi-select mode)
  final Set<Weekday>? selectedDays;

  /// Currently selected day (single-select mode)
  final Weekday? selectedDay;

  /// Callback when selection changes (multi-select mode)
  final ValueChanged<Set<Weekday>>? onMultiChanged;

  /// Callback when selection changes (single-select mode)
  final ValueChanged<Weekday?>? onSingleChanged;

  const WeekdaySelector._({
    super.key,
    required this.isMultiSelect,
    this.selectedDays,
    this.selectedDay,
    this.onMultiChanged,
    this.onSingleChanged,
  });

  /// Creates a multi-select weekday selector
  ///
  /// Users can select multiple days. Tapping a selected day deselects it.
  factory WeekdaySelector.multi({
    Key? key,
    required Set<Weekday> selectedDays,
    required ValueChanged<Set<Weekday>> onChanged,
  }) {
    return WeekdaySelector._(
      key: key,
      isMultiSelect: true,
      selectedDays: selectedDays,
      onMultiChanged: onChanged,
    );
  }

  /// Creates a single-select weekday selector
  ///
  /// Users can select one day at a time. Tapping a selected day deselects it.
  factory WeekdaySelector.single({
    Key? key,
    required Weekday? selectedDay,
    required ValueChanged<Weekday?> onChanged,
  }) {
    return WeekdaySelector._(
      key: key,
      isMultiSelect: false,
      selectedDay: selectedDay,
      onSingleChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Weekday.values.asMap().entries.map((entry) {
        final index = entry.key;
        final day = entry.value;
        final isSelected = isMultiSelect
            ? (selectedDays?.contains(day) ?? false)
            : selectedDay == day;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 2, // 4px gap = 2px on each side
              right: index == Weekday.values.length - 1 ? 0 : 2,
            ),
            child: _buildDayButton(day, isSelected),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDayButton(Weekday day, bool isSelected) {
    final backgroundColor =
        isSelected ? UIColor.secondary : UIColor.background;
    final textColor = isSelected ? UIColor.primary : UIColor.primaryDark;

    return GestureDetector(
      onTap: () => _handleTap(day, isSelected),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            day.shortLabel,
            style: UI.text.bodySmall.copyWith(
              color: textColor,
              height: 1.43, // 20px line height / 14px font size
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _handleTap(Weekday day, bool isCurrentlySelected) {
    if (isMultiSelect) {
      final newSelection = Set<Weekday>.from(selectedDays ?? {});
      if (isCurrentlySelected) {
        newSelection.remove(day);
      } else {
        newSelection.add(day);
      }
      onMultiChanged?.call(newSelection);
    } else {
      // Single-select: tapping selected day deselects it
      onSingleChanged?.call(isCurrentlySelected ? null : day);
    }
  }
}
