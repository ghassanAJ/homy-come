import 'package:design_system/design_system.dart';
import 'package:util/src/pagination/widgets/base_paginated_view.dart';
import 'package:util/util.dart';

class SliverPaginatedListView<T, P extends PaginationParams>
    extends BasePaginationView<T, P> {
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final Widget? separator;

  SliverPaginatedListView({
    super.key,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    Widget Function(BuildContext context)? loadingBuilder,
    super.loadMoreThreshold,
    this.padding,
    this.separator,
  }) : super(
         loadingBuilder:
             loadingBuilder ??
             ((_) => const Center(
               child: MDProgressIndicator(width: 32, height: 32),
             )),
       );

  @override
  BasePaginationViewState<T, P> createState() =>
      _SliverPaginatedListViewState<T, P>();
}

class _SliverPaginatedListViewState<T, P extends PaginationParams>
    extends BasePaginationViewState<T, P> {
  SliverPaginatedListView<T, P> get typedWidget =>
      widget as SliverPaginatedListView<T, P>;

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
    return SliverList.separated(
      itemBuilder: (BuildContext context, int index) {
        return buildPaginatedItem(
          index: index,
          itemCount: itemCount,
          isLoadMoreError: isLoadMoreError,
          state: state,
          cubit: cubit,
          isGrid: false,
          itemBuilder: paginatedWidget.itemBuilder,
        );
      },
      separatorBuilder:
          (_, __) => paginatedWidget.separator ?? const SizedBox.shrink(),
      itemCount: itemCount + (showLoader ? 1 : 0),
    );
  }
}
