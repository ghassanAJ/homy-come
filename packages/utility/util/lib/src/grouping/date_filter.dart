/// Enum representing date-based filter categories for grouping items.
enum DateFilter {
  /// Items from today
  today,

  /// Items from yesterday
  yesterday,

  /// Items from the last 7 days (excluding today and yesterday)
  lastWeek,

  /// Items older than last week
  earlier,
}
