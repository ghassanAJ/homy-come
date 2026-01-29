import 'package:flutter/material.dart';
import 'package:util/src/base_cubit/base_list_cubit.dart';
import 'package:util/src/collection/widgets/base_collection_view.dart';

class CollectionGridView<T> extends BaseCollectionView<T> {
  final SliverGridDelegate gridDelegate;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;

  const CollectionGridView({
    super.key,
    required this.gridDelegate,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    super.loadingBuilder,
    super.emptyMessage,

    super.onRefresh,
    this.padding,
    this.controller,
  });

  @override
  Widget buildScrollable(
    BuildContext context,
    List<T> items,
    BaseListCubit<T> cubit,
  ) {
    return GridView.builder(
      controller: controller,
      padding: padding,
      gridDelegate: gridDelegate,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final T item = items[index];
        return itemBuilder(context, item, index);
      },
    );
  }
}
