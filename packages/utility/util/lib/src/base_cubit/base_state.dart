// base_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:util/util.dart';

part 'base_state.freezed.dart';

enum BaseCubitStatus {
  initial,
  loading,
  success,
  error,
  addLoading,
  deleteLoading,
  updateLoading,
  createLoading,
  deleteSuccess,
  updateSuccess,
  createSuccess,
  fetchSuccess,
  updateExistData,
  updateExistDataSuccess,
  refreshLoading,
}

@freezed
abstract class BaseState<T> with _$BaseState<T> {
  const factory BaseState({
    @Default(BaseCubitStatus.initial) BaseCubitStatus status,
    T? data,
    APIException? error,
  }) = _BaseState<T>;

  const BaseState._();

  /// Success helper
  BaseState<T> success(T data) {
    return copyWith(status: BaseCubitStatus.success, data: data, error: null);
  }

  BaseState<T> updateExistDataSuccess(T data) {
    return copyWith(
      status: BaseCubitStatus.updateExistDataSuccess,
      data: data,
      error: null,
    );
  }

  /// Error helper
  BaseState<T> errorState(APIException e) {
    return copyWith(status: BaseCubitStatus.error, error: e);
  }

  /// Loading helper
  BaseState<T> loading({bool refresh = false, bool updateExistData = false}) {
    return copyWith(
      status:
          updateExistData
              ? BaseCubitStatus.updateExistData
              : refresh
              ? BaseCubitStatus.refreshLoading
              : BaseCubitStatus.loading,
      error: null,
    );
  }

  bool isEmptyList() {
    return data == null || data is List && (data as List).isEmpty;
  }

  bool get isLoading =>
      status == BaseCubitStatus.createLoading ||
      status == BaseCubitStatus.updateLoading ||
      status == BaseCubitStatus.deleteLoading;
}
