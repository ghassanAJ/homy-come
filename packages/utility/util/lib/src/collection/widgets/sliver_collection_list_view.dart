import 'package:flutter/material.dart';
import 'package:util/src/base_cubit/base_list_cubit.dart';
import 'package:util/src/collection/widgets/base_collection_view.dart';

class SliverCollectionListView<T> extends BaseCollectionView<T> {
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final Widget? separator;

  const SliverCollectionListView({
    super.key,
    required this.itemBuilder,
    super.emptyBuilder,
    super.errorBuilder,
    super.loadingBuilder,
    super.onRefresh,
    this.padding,
    this.separator,
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
        SliverList.separated(
          itemBuilder: (BuildContext context, int index) {
            final T item = items[index];
            return itemBuilder(context, item, index);
          },
          separatorBuilder: (_, __) => separator ?? const SizedBox.shrink(),
          itemCount: items.length,
        ),
      ],
    );
  }
}
