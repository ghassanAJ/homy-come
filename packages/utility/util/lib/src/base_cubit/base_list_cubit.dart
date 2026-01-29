import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:util/src/base_cubit/base_state.dart';
import 'package:util/util.dart';

/// A simple list-focused Cubit that exposes CRUD helpers for a list of items.
///
/// Optionally accepts a [loader] use case to support load/refresh flows.
@injectable
class BaseListCubit<T> extends Cubit<BaseState<List<T>>> {
  BaseUseCase<List<T>>? loader;

  BaseListCubit({this.loader}) : super(BaseState<List<T>>());

  /// Loads data using the configured [loader].
  Future<void> fetchItems([List<T>? initData]) async {
    if (initData != null) {
      emit(state.success(List<T>.from(initData)));
      return;
    }
    final useCase = loader;
    if (useCase == null) return;
    emit(state.loading());
    final res = await useCase.call();
    res.fold(
      (data) => emit(state.success(List<T>.from(data))),
      (error) => emit(state.errorState(error)),
    );
  }

  Future<void> refresh() => fetchItems();

  /// Replaces the entire list.
  void setItems(List<T> items) {
    emit(state.success(List<T>.from(items)));
  }

  /// Appends an item to the list.
  void addItem<Item>({BaseUseCase<Item>? useCase, T? item}) async {
    final current = List<T>.from(state.data ?? const []);

    if (useCase != null) {
      emit(state.copyWith(status: BaseCubitStatus.createLoading));
      final res = await useCase.call();
      res.fold((data) {
        final current = List<T>.from(state.data ?? const []);
        //TODO need discuss when the item should be added in the last
        current.insert(0, data as T);
        emit(
          state.copyWith(status: BaseCubitStatus.createSuccess, data: current),
        );
      }, (error) => emit(state.errorState(error)));
    } else {
      if (item != null) {
        current.insert(0, item as T);
        emit(
          state.copyWith(status: BaseCubitStatus.createSuccess, data: current),
        );
      }
    }
  }

  /// Updates items matching [where] using the [update] transformer.
  void updateWhere<Item>({
    BaseUseCase<Item>? useCase,
    required bool Function(T) where,
    required T Function(T) update,
  }) async {
    final current = List<T>.from(state.data ?? const []);

    if (useCase != null) {
      emit(state.copyWith(status: BaseCubitStatus.updateLoading));
      final res = await useCase.call();
      res.fold((data) {
        final updated = current.map((e) => where(e) ? update(e) : e).toList();
        emit(
          state.copyWith(status: BaseCubitStatus.updateSuccess, data: updated),
        );
      }, (error) => emit(state.errorState(error)));
    } else {
      final updated = current.map((e) => where(e) ? update(e) : e).toList();
      emit(
        state.copyWith(status: BaseCubitStatus.updateSuccess, data: updated),
      );
    }
  }

  /// Removes items that match [removeWhere].
  void deleteItem<Item>({
    BaseUseCase<Item>? useCase,
    required bool Function(T) removeWhere,
  }) async {
    final current = List<T>.from(state.data ?? const []);

    if (useCase != null) {
      emit(state.copyWith(status: BaseCubitStatus.deleteLoading));
      final res = await useCase.call();
      res.fold((data) {
        current.removeWhere(removeWhere);
        emit(
          state.copyWith(status: BaseCubitStatus.deleteSuccess, data: current),
        );
      }, (error) => emit(state.errorState(error)));
    } else {
      current.removeWhere(removeWhere);

      emit(
        state.copyWith(status: BaseCubitStatus.deleteSuccess, data: current),
      );
    }
  }
}
