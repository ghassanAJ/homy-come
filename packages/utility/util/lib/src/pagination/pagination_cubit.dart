// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:util/src/pagination/pagination_cubit_base.dart';
import 'package:util/util.dart';

part 'pagination_state.dart';

/// A [Cubit] that manages pagination state and handles paginated data fetching.
///
/// The [PaginationCubit] is responsible for loading paginated data, handling the
/// pagination state, and updating the UI with the data. It supports both loading
/// and refreshing data, including error handling, and offers load more functionality.
///

class PaginationCubit<T> extends BasePaginationCubit<T, PaginationParams> {
  PaginationCubit({required super.usecase, PaginationParams? initialParams})
    : super(
        initialParams:
            initialParams ?? PaginationParams(page: 0, itemsPerPage: 20),
      );
}

class BasePaginationCubit<T, P extends PaginationParams>
    extends PaginationCubitBase<T> {
  /// A function that loads a page of data.
  ///
  /// This function is passed to the [PaginationCubit] and is responsible for
  /// fetching data for a given page and returning a [Page] of type [T].
  final IPaginationFetchUseCase<T, P> usecase;
  final P initialParams;

  /// Creates an instance of [PaginationCubit] and initiates the first data load.
  ///
  /// The [usecase] function is provided to fetch paginated data.
  BasePaginationCubit({required this.usecase, required this.initialParams})
    : super(
        PaginationState<T>.initial(
          initialPage: initialParams.page,
          itemsPerPage: initialParams.itemsPerPage,
        ),
      ) {
    fetchNextPage(initialParams);
  }

  /// Fetches paginated data and updates the pagination state.
  ///
  /// This method checks if more data is being loaded (for "load more" scenarios)
  /// and updates the state accordingly. It handles empty responses, errors,
  /// and successful data fetches.
  Future<void> fetchNextPage(P params) async {
    bool isFirstFetch = params.page == initialParams.page;

    final res = await usecase.call(
      params.copyWith(itemsPerPage: state.itemsPerPage) as P,
    );
    res.fold((data) {
      log('data: ${data.items.length}');
      return data.items.isEmpty
          ? _handleEmptyResponse(isFirstFetch)
          : _handleNonEmptyResponse(data, isFirstFetch);
    }, (error) => _handleError(isFirstFetch, error));
  }

  /// Handles an empty response by updating the state and refresh controller.
  ///
  /// If it's a load more scenario, it sets the load state to "no data" and completes
  /// the refresh. If it's the first page (currentPage == 0), it updates the status to `noDataFound`.
  void _handleEmptyResponse(bool isFirstFetch) {
    if (isFirstFetch) {
      emit(state.copyWith(status: PaginationStatus.noDataFound));
    } else {
      emit(state.copyWith(status: PaginationStatus.noDataToLoad));
    }
  }

  /// Handles a non-empty response and updates the state with the new data.
  ///
  /// This method updates the paginated list with the new data and updates
  /// the refresh controller (either complete the refresh or load more).
  void _handleNonEmptyResponse(PageModel<T> pageModel, bool isFirstFetch) {
    final mergedItems =
        isFirstFetch
            ? pageModel.items
            : [...state.paginatedList.items, ...pageModel.items];

    // Determine if there's more data to load
    final hasNext = pageModel.hasNext ?? false;

    // Calculate if we've reached the end based on total items
    final totalItems = pageModel.totalNoOfItems ?? mergedItems.length;
    final hasLoadedAll = mergedItems.length >= totalItems;

    final updatedList = PageModel<T>(
      items: mergedItems,
      pageNumber: pageModel.pageNumber,
      totalNoOfItems: pageModel.totalNoOfItems,
      itemsPerPage: pageModel.itemsPerPage ?? state.itemsPerPage,
      totalPages: pageModel.totalPages,
      hasNext: hasNext && !hasLoadedAll,
      hasPrevious: pageModel.hasPrevious,
    );

    // If we've loaded all data or hasNext is false, mark as no more data to load
    final status =
        (!hasNext || hasLoadedAll)
            ? PaginationStatus.noDataToLoad
            : PaginationStatus.loadSuccess;

    emit(
      state.copyWith(
        paginatedList: updatedList,
        totalNoOfItems: pageModel.totalNoOfItems ?? state.totalNoOfItems,
        status: status,
        // Don't update currentPageNumber from API response to maintain consistent pagination
        // The state already has the correct page number set in the load() method
      ),
    );
  }

  /// Handles errors during data fetching and updates the state.
  ///
  /// This method handles errors by updating the refresh controller (either
  /// "load failed" or "refresh failed") and setting the appropriate state.
  void _handleError(bool isFirstFetch, APIException f) {
    if (isFirstFetch) {
      emit(state.paginationError(f));
    } else {
      emit(
        state.copyWith(
          status: PaginationStatus.loadMoreError,
          paginationFailure: f,
        ),
      );
    }
  }

  /// Loads data, either refreshing or loading more, based on the flag.
  ///
  /// If [isLoad] is false, it triggers a refresh. If true, it loads more data.
  @override
  Future<void> load(int page) async {
    bool isFirstFetch = page == initialParams.page;

    if (isFirstFetch) {
      emit(
        state.changePage(0).copyWith(paginatedList: PageModel.empty()),
      ); // Reset page on refresh
    }

    emit(
      state.copyWith(
        currentPageNumber: page,
        status:
            isFirstFetch
                ? PaginationStatus.refreshing
                : PaginationStatus.loadingMore,
      ),
    );
    fetchNextPage(
      initialParams.copyWith(page: page, itemsPerPage: state.itemsPerPage) as P,
    );
  }

  /// Resets and reloads the first page.
  Future<void> refresh({P? params}) async {
    final newParams = params ?? initialParams;
    emit(
      PaginationState<T>.initial(
        initialPage: newParams.page,
        itemsPerPage: newParams.itemsPerPage,
      ),
    );
    await fetchNextPage(newParams);
  }

  /// Retries loading data after an error occurs.
  ///
  /// This method resets the state and tries to load the data again.
  void tryAgain({P? params}) {
    final newParams = params ?? initialParams;
    emit(
      PaginationState<T>.initial(
        initialPage: initialParams.page,
        itemsPerPage: state.itemsPerPage,
      ),
    );
    fetchNextPage(newParams.copyWith(page: 0) as P);
  }

  /// Emits a new state with an updated list of items and recalculated totals.
  void _emitUpdatedList(List<T> items, {int? totalItems}) {
    log('before emitUpdatedList: ${items.length}');
    final currentTotal =
        state.paginatedList.totalNoOfItems ?? state.paginatedList.items.length;

    emit(
      state.copyWith(
        paginatedList: PageModel<T>(
          items: items,
          totalPages: state.paginatedList.totalPages,
          hasNext: state.paginatedList.hasNext,
          hasPrevious: state.paginatedList.hasPrevious,
          pageNumber: state.paginatedList.pageNumber,
          totalNoOfItems: totalItems ?? currentTotal,
          itemsPerPage: state.paginatedList.itemsPerPage ?? state.itemsPerPage,
        ),
        status: PaginationStatus.loadSuccess,
      ),
    );
    log('emitUpdatedList: ${items.length}');
  }

  /// Adds a single item to the end of the current list and updates totals.
  void addItemToLastPage({required T item}) {
    emit(state.addItem(item));
  }

  /// Updates items that match [where] by applying [update].
  void editItemWhere({
    required bool Function(T) where,
    required T Function(T) update,
  }) {
    final updatedItems =
        state.paginatedList.items.map((e) => where(e) ? update(e) : e).toList();

    _emitUpdatedList(updatedItems);
  }

  /// Removes items that satisfy [removeWhere] and updates totals accordingly.
  void removeItemWhereFromPage({required bool Function(T) removeWhere}) {
    final beforeItems = state.paginatedList.items;
    final afterItems = List<T>.from(beforeItems)..removeWhere(removeWhere);
    final removedCount = beforeItems.length - afterItems.length;
    final baseTotal = state.paginatedList.totalNoOfItems ?? beforeItems.length;
    final newTotal =
        (baseTotal - removedCount).clamp(0, double.infinity).toInt();

    _emitUpdatedList(afterItems, totalItems: newTotal);
  }
}
