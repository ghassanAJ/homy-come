import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppCubit extends Cubit<AppState> {
  final SessionRepository _sessionRepository;
  StreamSubscription<VerifiedUserModel?>? _userSubscription;

  AppCubit(this._sessionRepository) : super(AppState.initial(UserRole.user)) {
    _userSubscription = _sessionRepository.userStream.listen((user) async {
      if (user == null) {
        clearUser();
      } else {
        await Future.delayed(Duration(milliseconds: 3850));
        emit(state.copyWith(user: user, isInitializing: false));
      }
    });
  }
  void init(UserRole role) {
    emit(state.copyWith(role: role));
  }

  void updateUser(VerifiedUserModel user) {
    emit(state.copyWith(user: user));
  }

  void clearUser() {
    emit(
      AppState(
        userType: UserRole.user,
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
