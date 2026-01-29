import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:util/src/pagination/pagination_constants.dart';
import 'package:util/util.dart';

import 'base_state_view.dart';
import 'pagination_widgets.dart';

abstract class BasePaginationView<T, P extends PaginationParams>
    extends StatefulWidget {
  final SimpleBuilder? emptyBuilder;
  final ErrorBuilder? errorBuilder;
  final SimpleBuilder? loadingBuilder;
  final double loadMoreThreshold;
  final bool enableRefresh;
  final bool enableTryAgain;
  final String? emptyMessage;

  const BasePaginationView({
    super.key,
    this.emptyBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.loadMoreThreshold = PaginationConstants.defaultLoadMoreThreshold,
    this.enableRefresh = true,
    this.enableTryAgain = true,
    this.emptyMessage,
  });

  @override
  BasePaginationViewState<T, P> createState();
}

abstract class BasePaginationViewState<T, P extends PaginationParams>
    extends State<BasePaginationView<T, P>> {
  Widget buildScrollable(
    BuildContext context,
    PaginationState<T> state,
    BasePaginationCubit<T, P> cubit,
    bool isLoadingMore,
    bool isLoadMoreError,
    bool reachedEnd,
  );

  bool _shouldRebuild(PaginationState<T> previous, PaginationState<T> current) {
    return previous.paginatedList.items.length !=
            current.paginatedList.items.length ||
        previous.status != current.status ||
        previous.paginationFailure != current.paginationFailure;
  }

  bool _shouldLoadMore(
    ScrollNotification notification,
    PaginationState<T> state,
  ) {
    final reachedThreshold =
        notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - widget.loadMoreThreshold;

    // Don't load more if we've reached the end or if there's a load more error
    final canLoadMore =
        !state.isLoadingMore &&
        state.hasNext &&
        !state.reachedEnd &&
        state.status != PaginationStatus.noDataToLoad;

    return reachedThreshold && canLoadMore;
  }

  Widget _wrapWithRefreshIndicator(
    Widget child,
    BasePaginationCubit<T, P> cubit,
  ) {
    if (!widget.enableRefresh) return child;

    return RefreshIndicator.adaptive(
      onRefresh: () => cubit.refresh(params: cubit.initialParams),
      child: child,
    );
  }

  Widget buildPaginatedItem({
    required int index,
    required int itemCount,
    required bool isLoadMoreError,
    required PaginationState<T> state,
    required BasePaginationCubit<T, P> cubit,
    required bool isGrid,
    required Widget Function(BuildContext context, T item, int index)
    itemBuilder,
  }) {
    final isLoaderPosition = index >= itemCount;

    if (isLoaderPosition) {
      if (isLoadMoreError) {
        return PaginationErrorWidget(
          onRetry: () => cubit.load(state.nextPage),
          isGrid: isGrid,
        );
      }
      return PaginationLoader(isGrid: isGrid);
    }

    final item = state.paginatedList.items[index];
    return itemBuilder(context, item, index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePaginationCubit<T, P>, PaginationState<T>>(
      buildWhen: _shouldRebuild,
      builder: (context, state) {
        final cubit = context.read<BasePaginationCubit<T, P>>();

        final hasError = state.status == PaginationStatus.error;

        final scrollable = NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final currentState = cubit.state;

            if (_shouldLoadMore(notification, currentState)) {
              cubit.load(currentState.nextPage);
            }
            return false;
          },
          child: buildScrollable(
            context,
            state,
            cubit,
            state.isLoadingMore,
            state.isLoadMoreError,
            state.reachedEnd,
          ),
        );

        final content =
            widget.enableRefresh
                ? _wrapWithRefreshIndicator(scrollable, cubit)
                : scrollable;

        return BaseStateView(
          isLoading: _isInitialLoading(state),
          hasError: hasError,
          isEmpty: _isEmptyState(state),
          errorMessage: state.paginationFailure?.message,
          emptyMessage:
              widget.emptyMessage ?? PaginationConstants.defaultEmptyMessage,
          onRetry: widget.enableTryAgain ? () => cubit.tryAgain() : null,
          loadingBuilder: widget.loadingBuilder,
          errorBuilder: widget.errorBuilder,
          emptyBuilder: widget.emptyBuilder,
          child: content,
        );
      },
    );
  }

  bool _isInitialLoading(PaginationState<T> state) {
    final isEmpty = state.paginatedList.items.isEmpty;
    return state.status == PaginationStatus.initial ||
        (isEmpty && state.status == PaginationStatus.refreshing);
  }

  /// Checks if the current state represents an empty result set.
  ///
  /// Returns true when:
  /// - Status explicitly indicates no data found
  /// - Items list is empty
  bool _isEmptyState(PaginationState<T> state) {
    return state.status == PaginationStatus.noDataFound ||
        state.paginatedList.items.isEmpty;
  }
}
