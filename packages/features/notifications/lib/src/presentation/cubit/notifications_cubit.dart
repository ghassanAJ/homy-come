import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/src/domain/repository/notifications_repository.dart';
import 'package:notifications/src/presentation/cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._repository) : super(const NotificationsState());

  final NotificationsRepository _repository;

  void _safeEmit(NotificationsState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }

  Future<void> fetchNotifications() async {
    _safeEmit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.fetchNotifications();
    if (isClosed) return;

    result.fold((data) {
      log('Notifications loaded: ${data.length}');
      _safeEmit(
        state.copyWith(isLoading: false, notifications: data, error: null),
      );
    }, (error) => _safeEmit(state.copyWith(isLoading: false, error: error)));
  }
}
