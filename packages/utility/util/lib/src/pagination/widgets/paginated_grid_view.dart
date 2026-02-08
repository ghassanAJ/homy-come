import 'package:flutter/widgets.dart';
import 'package:util/src/pagination/widgets/base_paginated_view.dart';
import 'package:util/src/pagination/widgets/scroll_controller_mixin.dart';
import 'package:util/util.dart';

class PaginatedGridView<T, P extends PaginationParams>
    extends BasePaginationView<T, P> {
  final SliverGridDelegate gridDelegate;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final String? restorationId;

  const PaginatedGridView({
    super.key,
    required this.gridDelegate,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    super.loadingBuilder,
    super.loadMoreThreshold,
    this.padding,
    this.controller,
    this.restorationId,
  });

  @override
  BasePaginationViewState<T, P> createState() =>
      _PaginatedGridViewState<T, P>();
}

class _PaginatedGridViewState<T, P extends PaginationParams>
    extends BasePaginationViewState<T, P>
    with ScrollControllerManagement<T, P> {
  PaginatedGridView<T, P> get typedWidget => widget as PaginatedGridView<T, P>;

  @override
  ScrollController? get providedController => typedWidget.controller;

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
    return GridView.builder(
      key: PageStorageKey<String>(
        paginatedWidget.restorationId ?? 'paginated_grid_${cubit.hashCode}',
      ),
      controller: effectiveController,
      padding: paginatedWidget.padding,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: paginatedWidget.gridDelegate,
      itemCount:
          state.paginatedList.items.length +
          (isLoadingMore || isLoadMoreError ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        return buildPaginatedItem(
          index: index,
          itemCount: state.paginatedList.items.length,
          isLoadMoreError: isLoadMoreError,
          state: state,
          cubit: cubit,
          isGrid: true,
          itemBuilder: paginatedWidget.itemBuilder,
        );
      },
    );
  }
}
