import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:util/src/base_cubit/base_list_cubit.dart';
import 'package:util/src/base_cubit/base_state.dart';
import 'package:util/src/pagination/widgets/base_state_view.dart';

abstract class BaseCollectionView<T> extends StatelessWidget {
  final String? emptyMessage;
  final SimpleBuilder? emptyBuilder;
  final ErrorBuilder? errorBuilder;
  final SimpleBuilder? loadingBuilder;
  final Future<void> Function(BaseListCubit<T> cubit)? onRefresh;

  const BaseCollectionView({
    super.key,
    this.emptyMessage,
    this.emptyBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.onRefresh,
  });

  Widget buildScrollable(
    BuildContext context,
    List<T> items,
    BaseListCubit<T> cubit,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseListCubit<T>, BaseState<List<T>>>(
      builder: (context, state) {
        final cubit = context.read<BaseListCubit<T>>();
        final items = state.data ?? [];

        final content = buildScrollable(context, items, cubit);

        return BaseStateView(
          isLoading: state.status == BaseCubitStatus.loading,
          hasError: state.status == BaseCubitStatus.error,
          isEmpty: items.isEmpty,
          errorMessage: state.error?.toString(),
          emptyMessage: emptyMessage,
          onRetry: cubit.fetchItems,
          loadingBuilder: loadingBuilder,
          errorBuilder: errorBuilder,
          emptyBuilder: emptyBuilder,
          child:
              onRefresh != null
                  ? RefreshIndicator.adaptive(
                    onRefresh: () => onRefresh!(cubit),
                    child: content,
                  )
                  : content,
        );
      },
    );
  }
}
