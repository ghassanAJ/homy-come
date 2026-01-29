import 'package:flutter/material.dart';
import 'package:util/src/base_cubit/base_list_cubit.dart';
import 'package:util/src/collection/widgets/base_collection_view.dart';

class CollectionListView<T> extends BaseCollectionView<T> {
  final Widget Function(BuildContext context, List<T> items, int index)
  itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final Widget separator;

  const CollectionListView({
    super.key,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    super.loadingBuilder,
    super.onRefresh,
    super.emptyMessage,
    this.padding,
    this.controller,
    this.separator = const Divider(height: 1),
  });

  @override
  Widget buildScrollable(
    BuildContext context,
    List<T> items,
    BaseListCubit<T> cubit,
  ) {
    return ListView.separated(
      controller: controller,
      padding: padding,
      itemCount: items.length,
      separatorBuilder: (_, __) => separator,
      itemBuilder: (BuildContext context, int index) {
        return itemBuilder(context, items, index);
      },
    );
  }
}
