import 'package:util/src/grouping/date_filter.dart';

/// A model that encapsulates items grouped by date categories.
///
/// This provides a type-safe way to access grouped items with convenient
/// methods instead of working with raw maps.
///
/// Example:
/// ```dart
/// final grouped = DateGroupingHelper.groupByDate(tasks);
/// final todayTasks = grouped.today;
/// final hasYesterdayTasks = grouped.hasYesterday;
/// final allCategories = grouped.allCategories;
/// ```
class GroupedByDate<T> {
  final List<T> _today;
  final List<T> _yesterday;
  final List<T> _lastWeek;
  final List<T> _earlier;

  /// Creates a GroupedByDate instance with the provided lists.
  ///
  /// All parameters default to empty lists if not provided.
  GroupedByDate({
    List<T>? today,
    List<T>? yesterday,
    List<T>? lastWeek,
    List<T>? earlier,
  }) : _today = today ?? [],
       _yesterday = yesterday ?? [],
       _lastWeek = lastWeek ?? [],
       _earlier = earlier ?? [];

  /// Creates a GroupedByDate from a map of DateFilter to lists.
  factory GroupedByDate.fromMap(Map<DateFilter, List<T>> map) {
    return GroupedByDate(
      today: map[DateFilter.today],
      yesterday: map[DateFilter.yesterday],
      lastWeek: map[DateFilter.lastWeek],
      earlier: map[DateFilter.earlier],
    );
  }

  /// Items from today (0 days ago).
  List<T> get today => _today;

  /// Items from yesterday (1 day ago).
  List<T> get yesterday => _yesterday;

  /// Items from last week (2-7 days ago).
  List<T> get lastWeek => _lastWeek;

  /// Items older than 7 days.
  List<T> get earlier => _earlier;

  /// Whether there are any items from today.
  bool get hasToday => _today.isNotEmpty;

  /// Whether there are any items from yesterday.
  bool get hasYesterday => _yesterday.isNotEmpty;

  /// Whether there are any items from last week.
  bool get hasLastWeek => _lastWeek.isNotEmpty;

  /// Whether there are any items from earlier.
  bool get hasEarlier => _earlier.isNotEmpty;

  /// Total count of all items across all categories.
  int get totalCount =>
      _today.length + _yesterday.length + _lastWeek.length + _earlier.length;

  /// Whether there are no items in any category.
  bool get isEmpty => totalCount == 0;

  /// Whether there are items in at least one category.
  bool get isNotEmpty => totalCount > 0;

  /// Get items for a specific date filter.
  ///
  /// Example:
  /// ```dart
  /// final items = grouped.getItemsFor(DateFilter.today);
  /// ```
  List<T> getItemsFor(DateFilter filter) {
    switch (filter) {
      case DateFilter.today:
        return _today;
      case DateFilter.yesterday:
        return _yesterday;
      case DateFilter.lastWeek:
        return _lastWeek;
      case DateFilter.earlier:
        return _earlier;
    }
  }

  /// Check if a specific date filter has items.
  bool hasItemsFor(DateFilter filter) {
    return getItemsFor(filter).isNotEmpty;
  }

  /// Get count of items for a specific date filter.
  int getCountFor(DateFilter filter) {
    return getItemsFor(filter).length;
  }

  /// Get all non-empty categories.
  ///
  /// Returns a list of DateFilter values that have at least one item.
  ///
  /// Example:
  /// ```dart
  /// final categories = grouped.nonEmptyCategories;
  /// // [DateFilter.today, DateFilter.lastWeek]
  /// ```
  List<DateFilter> get nonEmptyCategories {
    return DateFilter.values.where((filter) => hasItemsFor(filter)).toList();
  }

  /// Get all categories with their items as a map.
  ///
  /// Useful when you need to iterate over all categories.
  Map<DateFilter, List<T>> toMap() {
    return {
      DateFilter.today: _today,
      DateFilter.yesterday: _yesterday,
      DateFilter.lastWeek: _lastWeek,
      DateFilter.earlier: _earlier,
    };
  }

  /// Get all items flattened into a single list.
  ///
  /// Items are ordered: today -> yesterday -> lastWeek -> earlier
  List<T> get allItems {
    return [..._today, ..._yesterday, ..._lastWeek, ..._earlier];
  }

  /// Apply a function to all items in all categories.
  ///
  /// Example:
  /// ```dart
  /// grouped.forEach((filter, items) {
  ///   print('${filter.name}: ${items.length} items');
  /// });
  /// ```
  void forEach(void Function(DateFilter filter, List<T> items) action) {
    action(DateFilter.today, _today);
    action(DateFilter.yesterday, _yesterday);
    action(DateFilter.lastWeek, _lastWeek);
    action(DateFilter.earlier, _earlier);
  }

  /// Map each category to a new value.
  ///
  /// Example:
  /// ```dart
  /// final counts = grouped.map((filter, items) => items.length);
  /// // [todayCount, yesterdayCount, lastWeekCount, earlierCount]
  /// ```
  List<R> map<R>(R Function(DateFilter filter, List<T> items) mapper) {
    return [
      mapper(DateFilter.today, _today),
      mapper(DateFilter.yesterday, _yesterday),
      mapper(DateFilter.lastWeek, _lastWeek),
      mapper(DateFilter.earlier, _earlier),
    ];
  }

  /// Copy with updated values.
  GroupedByDate<T> copyWith({
    List<T>? today,
    List<T>? yesterday,
    List<T>? lastWeek,
    List<T>? earlier,
  }) {
    return GroupedByDate(
      today: today ?? _today,
      yesterday: yesterday ?? _yesterday,
      lastWeek: lastWeek ?? _lastWeek,
      earlier: earlier ?? _earlier,
    );
  }

  @override
  String toString() {
    return 'GroupedByDate(today: ${_today.length}, yesterday: ${_yesterday.length}, '
        'lastWeek: ${_lastWeek.length}, earlier: ${_earlier.length})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupedByDate<T> &&
        _listEquals(_today, other._today) &&
        _listEquals(_yesterday, other._yesterday) &&
        _listEquals(_lastWeek, other._lastWeek) &&
        _listEquals(_earlier, other._earlier);
  }

  @override
  int get hashCode {
    return _today.hashCode ^
        _yesterday.hashCode ^
        _lastWeek.hashCode ^
        _earlier.hashCode;
  }

  bool _listEquals<E>(List<E> a, List<E> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
