import 'package:flutter/material.dart';
import 'package:util/src/base_cubit/base_list_cubit.dart';
import 'package:util/src/collection/widgets/base_collection_view.dart';

class SliverCollectionGridView<T> extends BaseCollectionView<T> {
  final SliverGridDelegate gridDelegate;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;

  const SliverCollectionGridView({
    super.key,
    required this.gridDelegate,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    super.loadingBuilder,
    super.onRefresh,
    this.padding,
  });

  @override
  Widget buildScrollable(
    BuildContext context,
    List<T> items,
    BaseListCubit<T> cubit,
  ) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        if (padding != null) SliverPadding(padding: padding!),
        SliverGrid.builder(
          gridDelegate: gridDelegate,
          itemBuilder: (BuildContext context, int index) {
            final T item = items[index];
            return itemBuilder(context, item, index);
          },
          itemCount: items.length,
        ),
      ],
    );
  }
}
