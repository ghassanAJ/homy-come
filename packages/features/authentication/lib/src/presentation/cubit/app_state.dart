import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';

class AppState {
  final VerifiedUserModel? user;
  final ThemeMode themeMode;
  final UserRole userType;
  final bool isOnline;
  final bool isInitializing;

  const AppState({
    this.user,
    this.themeMode = ThemeMode.light,
    this.isOnline = true,
    this.isInitializing = true,
    required this.userType,
  });

  factory AppState.initial(UserRole userType) =>
      AppState(isInitializing: true, userType: userType);

  bool get isAuthenticated => user != null;
  bool get isProfileComplete => true; //  user?.hasCompletedProfile ?? false;
  String? get userId => user?.id.toString();
  String? get userName => user?.phone;

  AppState copyWith({
    VerifiedUserModel? user,
    ThemeMode? themeMode,
    bool? isOnline,
    bool? isInitializing,
    UserRole? role,
  }) {
    return AppState(
      user: user ?? this.user,
      themeMode: themeMode ?? this.themeMode,
      isOnline: isOnline ?? this.isOnline,
      isInitializing: isInitializing ?? this.isInitializing,
      userType: role ?? userType,
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
