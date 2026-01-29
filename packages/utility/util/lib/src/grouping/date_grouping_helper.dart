import 'dart:developer';

import 'package:util/src/grouping/date_filter.dart';
import 'package:util/src/grouping/date_groupable.dart';
import 'package:util/src/grouping/grouped_by_date.dart';

/// A utility class for grouping items by date categories.
///
/// This class provides functionality to group any list of [DateGroupable] items
/// into date-based categories (today, yesterday, last week, earlier).
///
/// Example usage:
/// ```dart
/// class TaskModel implements DateGroupable {
///   final DateTime? createdAt;
///
///   @override
///   DateTime? get groupingDate => createdAt;
/// }
///
/// final tasks = [/* list of tasks */];
/// final grouped = DateGroupingHelper.groupByDate(tasks);
/// final todayTasks = grouped[DateFilter.today] ?? [];
/// ```
class DateGroupingHelper {
  DateGroupingHelper._();

  /// Groups a list of [DateGroupable] items by date categories.
  ///
  /// Items are categorized as follows:
  /// - [DateFilter.today]: Items from the current day (same calendar day)
  /// - [DateFilter.yesterday]: Items from yesterday (previous calendar day)
  /// - [DateFilter.lastWeek]: Items from 2-7 calendar days ago
  /// - [DateFilter.earlier]: Items older than 7 calendar days
  ///
  /// If an item's [groupingDate] is null, it defaults to the current time.
  ///
  /// Returns a [GroupedByDate] model with convenient accessors.
  ///
  /// Note: Uses calendar days, not 24-hour periods. An item from yesterday
  /// at 23:59 will be correctly grouped as "yesterday" even if checked at
  /// 00:01 today (only 2 minutes difference).
  ///
  /// Example:
  /// ```dart
  /// final grouped = DateGroupingHelper.groupByDate(tasks);
  /// final todayTasks = grouped.today;
  /// final count = grouped.totalCount;
  /// ```
  static GroupedByDate<T> groupByDate<T extends DateGroupable>(List<T> items) {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);
    final today = <T>[];
    final yesterday = <T>[];
    final lastWeek = <T>[];
    final earlier = <T>[];

    for (final item in items) {
      final DateTime itemDateTime = item.groupingDate ?? DateTime.now();
      final itemDate = DateTime(
        itemDateTime.year,
        itemDateTime.month,
        itemDateTime.day,
      );
      final diff = nowDate.difference(itemDate).inDays;

      if (diff == 0) {
        today.add(item);
      } else if (diff == 1) {
        yesterday.add(item);
      } else if (diff > 1 && diff <= 7) {
        lastWeek.add(item);
      } else {
        earlier.add(item);
      }
    }

    return GroupedByDate(
      today: today,
      yesterday: yesterday,
      lastWeek: lastWeek,
      earlier: earlier,
    );
  }

  /// Alternative version that accepts a custom date extractor function.
  ///
  /// This is useful when you want to group items that don't implement
  /// [DateGroupable], or when you want to use a different date field
  /// than the one specified in [groupingDate].
  ///
  /// Returns a [GroupedByDate] model with convenient accessors.
  ///
  /// Note: Uses calendar days, not 24-hour periods. An item from yesterday
  /// at 23:59 will be correctly grouped as "yesterday" even if checked at
  /// 00:01 today (only 2 minutes difference).
  ///
  /// Example:
  /// ```dart
  /// final grouped = DateGroupingHelper.groupByDateWithExtractor(
  ///   tasks,
  ///   (task) => task.updatedAt, // Use updatedAt instead of createdAt
  /// );
  /// final todayTasks = grouped.today;
  /// ```
  static GroupedByDate<T> groupByDateWithExtractor<T>(
    List<T> items,
    DateTime? Function(T) dateExtractor,
  ) {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);
    final today = <T>[];
    final yesterday = <T>[];
    final lastWeek = <T>[];
    final earlier = <T>[];

    for (final item in items) {
      final DateTime itemDateTime = dateExtractor(item) ?? DateTime.now();
      final itemDate = DateTime(
        itemDateTime.year,
        itemDateTime.month,
        itemDateTime.day,
      );
      final diff = nowDate.difference(itemDate).inDays;
      log('itemDate: $itemDate, diff: $diff');

      if (diff == 0) {
        today.add(item);
      } else if (diff == 1) {
        yesterday.add(item);
      } else if (diff > 1 && diff <= 7) {
        lastWeek.add(item);
      } else {
        earlier.add(item);
      }
    }

    return GroupedByDate(
      today: today,
      yesterday: yesterday,
      lastWeek: lastWeek,
      earlier: earlier,
    );
  }

  /// Gets a human-readable label for a [DateFilter].
  static String getFilterLabel(DateFilter filter) {
    switch (filter) {
      case DateFilter.today:
        return 'Today';
      case DateFilter.yesterday:
        return 'Yesterday';
      case DateFilter.lastWeek:
        return 'Last Week';
      case DateFilter.earlier:
        return 'Earlier';
    }
  }
}
