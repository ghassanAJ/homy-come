/// Constants used throughout the pagination system.
class PaginationConstants {
  PaginationConstants._();

  /// Default threshold in pixels before the end of scroll to trigger load more.
  static const double defaultLoadMoreThreshold = 200.0;

  /// Default error message when loading more items fails.
  static const String defaultLoadMoreErrorMessage = 'Failed to load more items';

  /// Default label for retry button.
  static const String defaultRetryLabel = 'Retry';

  /// Default empty state message.
  static const String defaultEmptyMessage = 'No items found';

  /// Default unknown error message.
  static const String defaultUnknownErrorMessage = 'Unknown error';

  /// Default "try again" button label.
  static const String defaultTryAgainLabel = 'Try again';
}
