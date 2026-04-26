import 'dart:async';
import 'dart:developer';

import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';

@singleton
class AppCubit extends Cubit<AppState> {
  final SessionRepository _sessionRepository;
  StreamSubscription<VerifiedUserModel?>? _userSubscription;

  AppCubit(this._sessionRepository) : super(AppState.initial()) {
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
    emit(
      state.copyWith(
        role: role,
        addresses: [
          UserddressModel(
            id: 1,
            latitude: 33.4,
            longitude: 44.33,
            name: 'Home',
            addressTitle: 'Jumairah',
            isDefault: false,
          ),
          UserddressModel(
            id: 2,
            latitude: 33.4,
            longitude: 44.33,
            name: 'Office',
            addressTitle: "Dubai",
            isDefault: true,
          ),
        ],
      ),
    );
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

  void setDefaultAddress(int id) {
    final updated =
        state.addresses.map((e) {
          return e.copyWith(isDefault: e.id == id);
        }).toList();
    log('set updated ${updated[0].isDefault}');
    emit(state.copyWith(addresses: updated));
  }

  void addAddress(UserddressModel address) {
    log('addAddress');
    final updated = [...state.addresses, address];
    emit(state.copyWith(addresses: updated));
  }
}
