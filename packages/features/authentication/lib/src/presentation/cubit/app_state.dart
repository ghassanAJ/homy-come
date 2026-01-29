import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';

class AppState {
  final UserModel? user;
  final ThemeMode themeMode;
  final bool isOnline;
  final bool isInitializing;

  const AppState({
    this.user,
    this.themeMode = ThemeMode.light,
    this.isOnline = true,
    this.isInitializing = true,
  });

  factory AppState.initial() => const AppState(isInitializing: true);

  bool get isAuthenticated => user != null;
  bool get isProfileComplete => user?.hasCompletedProfile ?? false;
  UserType? get userType => user?.type;
  bool get isParent => user?.type == UserType.parent;
  bool get isChild => user?.type == UserType.child;
  String? get userId => user?.id;
  String? get userName => user?.fullName;

  AppState copyWith({
    UserModel? user,
    ThemeMode? themeMode,
    bool? isOnline,
    bool? isInitializing,
  }) {
    return AppState(
      user: user ?? this.user,
      themeMode: themeMode ?? this.themeMode,
      isOnline: isOnline ?? this.isOnline,
      isInitializing: isInitializing ?? this.isInitializing,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.user == user &&
        other.themeMode == themeMode &&
        other.isOnline == isOnline &&
        other.isInitializing == isInitializing;
  }

  @override
  int get hashCode {
    return Object.hash(user, themeMode, isOnline, isInitializing);
  }

  @override
  String toString() {
    return 'AppState(user: $user, isAuthenticated: $isAuthenticated, isProfileComplete: $isProfileComplete, themeMode: $themeMode, isOnline: $isOnline, isInitializing: $isInitializing)';
  }
}
