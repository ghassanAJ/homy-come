import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'app_state.dart';

@singleton
class AppCubit extends Cubit<AppState> {
  final SessionRepository _sessionRepository;
  StreamSubscription<UserModel?>? _userSubscription;

  AppCubit(this._sessionRepository) : super(AppState.initial()) {
    _userSubscription = _sessionRepository.userStream.listen((user) {
      if (user == null) {
        clearUser();
      } else {
        emit(state.copyWith(user: user, isInitializing: false));
      }
    });
  }

  void clearUser() {
    emit(
      AppState(
        user: null,
        themeMode: state.themeMode,
        isOnline: state.isOnline,
        isInitializing: false,
      ),
    );
  }

  void setTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
