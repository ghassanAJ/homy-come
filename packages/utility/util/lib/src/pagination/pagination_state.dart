part of 'pagination_cubit.dart';

/// Enum representing the different states of pagination.
///
/// This enum defines various statuses that the [PaginationCubit] can have, including:
/// - `initial`: The initial state before any data is loaded.
/// - `refreshing`: When data is being refreshed.
/// - `loading`: When data is being loaded.
/// - `error`: When an error occurs during data fetching.
/// - `loadMoreError`: When an error occurs while loading more data.
/// - `noDataFound`: When no data is found for the first page.
/// - `noDataToLoad`: When no more data can be loaded.
/// - `loadSuccess`: When data is successfully loaded.
/// - `refreshSuccess`: When data is successfully refreshed.

enum PaginationStatus {
  initial,
  refreshing,
  loading,
  error,
  loadMoreError,
  noDataFound,
  noDataToLoad,
  loadSuccess,
  loadingMore,
  refreshSuccess,
}

/// A state class representing the pagination state in a [PaginationCubit].
///
/// This class holds information about the current pagination status, the
/// paginated data, the current page, and the refresh controller for handling
/// pull-to-refresh actions.
class PaginationState<T> {
  final PaginationStatus status;
  final APIException? paginationFailure;
  final PageModel<T> paginatedList;
  final int itemsPerPage;
  final int totalNoOfItems;
  final int currentPageNumber;

  int get nextPage => currentPageNumber + 1;

  /// Private constructor for initializing the state.
  const PaginationState._({
    required this.status,
    required this.paginationFailure,
    required this.paginatedList,
    required this.itemsPerPage,
    required this.currentPageNumber,
    required this.totalNoOfItems,
  });

  /// Initial state of pagination with default values.
  PaginationState.initial({int initialPage = 0, this.itemsPerPage = 10})
    : status = PaginationStatus.initial,
      paginationFailure = null,
      currentPageNumber = initialPage,
      paginatedList = PageModel.empty(),
      totalNoOfItems = 0;

  /// Updates the state when a pagination error occurs.
  ///
  /// This method is used to handle failures during data fetching, such as
  /// network issues or server errors, and sets the appropriate error status.
  PaginationState<T> paginationError(APIException failure) {
    return copyWith(status: PaginationStatus.error, paginationFailure: failure);
  }

  /// Updates the current page in the state.
  ///
  /// This is used to handle pagination when switching between pages.
  PaginationState<T> changePage(int currentPage) {
    return copyWith(currentPageNumber: currentPage);
  }

  PaginationState<T> addItem(T item) {
    final previousItems = paginatedList.items;
    final updatedItems = [...previousItems, item];
    final previousTotal = paginatedList.totalNoOfItems ?? previousItems.length;
    return copyWith(
      paginatedList: PageModel<T>(
        items: updatedItems,
        pageNumber: paginatedList.pageNumber,
        totalNoOfItems: previousTotal + 1,
        itemsPerPage: paginatedList.itemsPerPage ?? itemsPerPage,
        totalPages: paginatedList.totalPages,
        hasNext: paginatedList.hasNext,
        hasPrevious: paginatedList.hasPrevious,
      ),
      status: PaginationStatus.loadSuccess,
    );
  }

  /// Creates a new state by copying the current state and updating the fields
  /// that are passed as parameters.
  PaginationState<T> copyWith({
    PaginationStatus? status,
    APIException? paginationFailure,
    PageModel<T>? paginatedList,
    int? itemsPerPage,
    int? currentPageNumber,
    int? totalNoOfItems,
  }) {
    return PaginationState._(
      status: status ?? this.status,
      currentPageNumber: currentPageNumber ?? this.currentPageNumber,
      paginationFailure: paginationFailure ?? this.paginationFailure,
      paginatedList: paginatedList ?? this.paginatedList,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      totalNoOfItems: totalNoOfItems ?? this.totalNoOfItems,
    );
  }

  /// Determines if the list should be displayed based on the current pagination status.
  ///
  /// Returns `true` if the status is either `loadSuccess`, `refreshSuccess`,
  /// or `loading`, indicating that data should be shown.
  bool isShowList() {
    return paginatedList.items.isNotEmpty;
  }

  bool get isLoadingMore =>
      status == PaginationStatus.loadingMore ||
      status == PaginationStatus.refreshing ||
      status == PaginationStatus.initial;
  bool get isLoadMoreError => status == PaginationStatus.loadMoreError;
  bool get reachedEnd =>
      status == PaginationStatus.noDataToLoad ||
      !(paginatedList.hasNext ?? false);
  bool get hasData => paginatedList.items.isNotEmpty;
  bool get hasNext {
    log('hasNext: ${paginatedList.hasNext}');
    return (paginatedList.hasNext ?? false);
  }
}
