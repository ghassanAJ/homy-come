import 'package:design_system/design_system.dart';
import 'package:util/src/pagination/pagination_constants.dart';

/// A loader widget for pagination, adaptable for list and grid contexts.
class PaginationLoader extends StatelessWidget {
  /// Whether this loader is being used in a grid context.
  final bool isGrid;

  /// Optional custom width for the progress indicator.
  final double? width;

  /// Optional custom height for the progress indicator.
  final double? height;

  const PaginationLoader({
    super.key,
    this.isGrid = false,
    this.width = 32,
    this.height = 32,
  });

  @override
  Widget build(BuildContext context) {
    final indicator = MDProgressIndicator(
      width: width ?? 32,
      height: height ?? 32,
    );

    if (isGrid) {
      return Center(
        child: Padding(padding: const EdgeInsets.all(12), child: indicator),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(child: indicator),
    );
  }
}

/// An error widget for pagination load more failures, adaptable for list and grid contexts.
class PaginationErrorWidget extends StatelessWidget {
  /// Callback triggered when the user taps retry.
  final VoidCallback onRetry;

  /// Whether this error widget is being used in a grid context.
  final bool isGrid;

  /// Optional custom error message.
  final String? message;

  const PaginationErrorWidget({
    super.key,
    required this.onRetry,
    this.isGrid = false,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      return Center(
        child: TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: Text(message ?? PaginationConstants.defaultRetryLabel),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              message ?? PaginationConstants.defaultLoadMoreErrorMessage,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(PaginationConstants.defaultRetryLabel),
          ),
        ],
      ),
    );
  }
}
