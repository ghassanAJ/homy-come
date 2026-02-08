/// An interface that defines a contract for models that can be grouped by date.
///
/// Any model that implements this interface can be used with [DateGroupingHelper]
/// to automatically group items by date categories.
abstract class DateGroupable {
  /// The date to use for grouping this item.
  ///
  /// This should return the relevant date for grouping purposes
  /// (e.g., createdAt, updatedAt, dueDate, etc.)
  DateTime? get groupingDate;
}
