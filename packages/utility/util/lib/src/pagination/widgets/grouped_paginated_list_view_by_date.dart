// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:util/src/pagination/widgets/base_paginated_view.dart';
import 'package:util/src/pagination/widgets/scroll_controller_mixin.dart';
import 'package:util/util.dart';

/// A widget that displays grouped items by date categories.
///
/// This widget uses [GroupedByDate] to automatically render items grouped
/// by date filters (today, yesterday, last week, earlier).
///
/// Example:
/// ```dart
/// final grouped = DateGroupingHelper.groupByDate(tasks);
/// GroupedPaginatedListView<TaskModel>(
///   groupedData: grouped,
///   itemBuilder: (context, task, index) => TaskCard(task: task),
/// );
/// ```
class GroupedPaginatedListViewByDate<T, P extends PaginationParams>
    extends BasePaginationView<T, P> {
  final GroupedByDate<T> groupedData;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context, DateFilter filter)? headerBuilder;
  final Widget? separator;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? sectionPadding;
  final ScrollController? controller;
  const GroupedPaginatedListViewByDate({
    super.key,
    super.enableRefresh = false,
    super.emptyBuilder,
    super.errorBuilder,
    super.loadingBuilder,
    required this.groupedData,
    required this.itemBuilder,
    this.headerBuilder,
    this.separator,
    this.padding,
    this.sectionPadding,
    this.controller,
  });

  @override
  BasePaginationViewState<T, P> createState() {
    return _GroupedPaginatedListViewState<T, P>();
  }
}

class _GroupedPaginatedListViewState<T, P extends PaginationParams>
    extends BasePaginationViewState<T, P>
    with ScrollControllerManagement<T, P> {
  GroupedPaginatedListViewByDate<T, P> get typedWidget =>
      widget as GroupedPaginatedListViewByDate<T, P>;

  @override
  Widget buildScrollable(
    BuildContext context,
    PaginationState<T> state,
    BasePaginationCubit<T, P> cubit,
    bool isLoadingMore,
    bool isLoadMoreError,
    bool reachedEnd,
  ) {
    final nonEmptyCategories = typedWidget.groupedData.nonEmptyCategories;

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: effectiveController,
      padding: typedWidget.padding,
      itemCount: nonEmptyCategories.length,
      itemBuilder: (context, index) {
        final filter = nonEmptyCategories[index];
        final items = typedWidget.groupedData.getItemsFor(filter);

        return _GroupSection(
          isLoadingMore: isLoadingMore,
          filter: filter,
          items: items,
          itemBuilder: typedWidget.itemBuilder,
          headerBuilder: typedWidget.headerBuilder,
          separator: typedWidget.separator,
          padding: typedWidget.sectionPadding,
          isLastSection: index == nonEmptyCategories.length - 1,
        );
      },
    );
  }

  @override
  ScrollController? get providedController => typedWidget.controller;
}

class _GroupSection<T> extends StatelessWidget {
  final DateFilter filter;
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context, DateFilter filter)? headerBuilder;
  final Widget? separator;
  final EdgeInsetsGeometry? padding;
  final bool isLastSection;
  final bool isLoadingMore;
  const _GroupSection({
    required this.filter,
    required this.items,
    required this.itemBuilder,
    this.headerBuilder,
    this.separator,
    this.padding,
    this.isLastSection = false,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? Padding(
          padding: padding ?? const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Section header
              headerBuilder?.call(context, filter) ??
                  _DefaultSectionHeader(
                    label: DateGroupingHelper.getFilterLabel(filter),
                  ),
              // Section items
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder:
                    (_, __) => separator ?? const SizedBox.shrink(),
                itemBuilder: (context, index) {
                  return itemBuilder(context, items[index], index);
                },
              ),
              if (isLastSection && isLoadingMore) ...[
                SizedBox(height: 16),
                const Center(child: CircularProgressIndicator.adaptive()),
                SizedBox(height: 16),
              ],
              if (isLastSection && !isLoadingMore) SizedBox(height: 120),
            ],
          ),
        )
        : const SizedBox.shrink();
  }
}

/// Default header widget for section titles
class _DefaultSectionHeader extends StatelessWidget {
  final String label;

  const _DefaultSectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 24),
      child: UIText.bodyMedium(label, fontWeight: FontWeight.w600),
    );
  }
}
