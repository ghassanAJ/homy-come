// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:util/src/pagination/widgets/base_paginated_view.dart';
import 'package:util/src/pagination/widgets/scroll_controller_mixin.dart';
import 'package:util/util.dart';

class PaginatedListView<T, P extends PaginationParams>
    extends BasePaginationView<T, P> {
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final Widget separator;
  final String? restorationId;
  @override
  final bool enableTryAgain;
  PaginatedListView({
    super.key,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    Widget Function(BuildContext context)? loadingBuilder,
    super.loadMoreThreshold,
    this.padding,
    this.controller,
    this.enableTryAgain = true,
    this.separator = const SizedBox.shrink(),
    this.restorationId,
  }) : super(
         loadingBuilder:
             loadingBuilder ??
             ((_) => const Center(child: MDProgressIndicator(styled: true))),
         enableTryAgain: enableTryAgain,
       );

  @override
  BasePaginationViewState<T, P> createState() =>
      _PaginatedListViewState<T, P>();
}

class _PaginatedListViewState<T, P extends PaginationParams>
    extends BasePaginationViewState<T, P>
    with ScrollControllerManagement<T, P> {
  PaginatedListView<T, P> get typedWidget => widget as PaginatedListView<T, P>;

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
    return ListView.separated(
      key: PageStorageKey<String>(
        paginatedWidget.restorationId ?? 'paginated_list_${cubit.hashCode}',
      ),
      controller: effectiveController,
      padding: paginatedWidget.padding,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount:
          state.paginatedList.items.length +
          (isLoadingMore || isLoadMoreError ? 1 : 0),
      separatorBuilder: (_, __) => paginatedWidget.separator,
      itemBuilder: (BuildContext context, int index) {
        return buildPaginatedItem(
          index: index,
          itemCount: state.paginatedList.items.length,
          isLoadMoreError: isLoadMoreError,
          state: state,
          cubit: cubit,
          isGrid: false,
          itemBuilder: paginatedWidget.itemBuilder,
        );
      },
    );
  }
}
