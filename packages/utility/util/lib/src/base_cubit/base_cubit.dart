// base_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:util/src/base_cubit/base_state.dart';
import 'package:util/src/base_usecase/base_use_case.dart';

@injectable
@singleton
class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit() : super(BaseState<T>());

  Future<void> execute({required BaseUseCase<T> useCase}) async {
    emit(state.loading());
    final data = await useCase.call();
    data.fold(
      (data) => emit(state.success(data)),
      (error) => emit(state.errorState(error)),
    );
  }
}

@injectable
@singleton
class BaseScreenCubit<T> extends Cubit<BaseState<T>> {
  BaseScreenCubit() : super(BaseState<T>());

  Future<void> fetchData({
    required BaseUseCase<T> useCase,
    bool refresh = false,
    bool updateExistData = false,
  }) async {
    emit(state.loading(refresh: refresh, updateExistData: updateExistData));

    final data = await useCase.call();

    data.fold(
      (data) => emit(
        updateExistData
            ? state.updateExistDataSuccess(data)
            : state.success(data),
      ),
      (error) => emit(state.errorState(error)),
    );
  }

  void updateData(T data) {
    emit(
      state.copyWith(
        data: data,
        status: BaseCubitStatus.updateExistDataSuccess,
      ),
    );
  }
}
