import 'package:flutter/widgets.dart';
import 'package:util/src/pagination/widgets/base_paginated_view.dart';
import 'package:util/util.dart';

class SliverPaginatedGridView<T, P extends PaginationParams>
    extends BasePaginationView<T, P> {
  final SliverGridDelegate gridDelegate;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;

  const SliverPaginatedGridView({
    super.key,
    required this.gridDelegate,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    super.loadingBuilder,
    super.loadMoreThreshold,
    this.padding,
  });

  @override
  BasePaginationViewState<T, P> createState() =>
      _SliverPaginatedGridViewState<T, P>();
}

class _SliverPaginatedGridViewState<T, P extends PaginationParams>
    extends BasePaginationViewState<T, P> {
  SliverPaginatedGridView<T, P> get typedWidget =>
      widget as SliverPaginatedGridView<T, P>;

  @override
  Widget buildScrollable(
    BuildContext context,
    PaginationState<T> state,
    BasePaginationCubit<T, P> cubit,
    bool isLoadingMore,
    bool isLoadMoreError,
    bool reachedEnd,
  ) {
    final paginatedWidget = typedWidget;
    final int itemCount = state.paginatedList.items.length;
    final bool showLoader = isLoadingMore || isLoadMoreError;
    return SliverGrid.builder(
      gridDelegate: paginatedWidget.gridDelegate,
      itemBuilder: (BuildContext context, int index) {
        return buildPaginatedItem(
          index: index,
          itemCount: itemCount,
          isLoadMoreError: isLoadMoreError,
          state: state,
          cubit: cubit,
          isGrid: true,
          itemBuilder: paginatedWidget.itemBuilder,
        );
      },
      itemCount: itemCount + (showLoader ? 1 : 0),
    );
  }
}
