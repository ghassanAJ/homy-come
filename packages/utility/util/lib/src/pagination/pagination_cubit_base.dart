import 'package:bloc/bloc.dart';
import 'package:util/util.dart';

abstract class PaginationCubitBase<T> extends Cubit<PaginationState<T>> {
  PaginationCubitBase(super.initialState);
  Future<void> load(int page);
}
