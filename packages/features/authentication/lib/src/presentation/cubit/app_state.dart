import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';

class AppState {
  final VerifiedUserModel? user;
  final ThemeMode themeMode;
  final UserRole? userType;
  final bool isOnline;
  final int? selectedAddressId;
  final bool isInitializing;
  final List<UserddressModel> addresses;

  const AppState({
    this.user,
    this.themeMode = ThemeMode.light,
    this.isOnline = true,
    this.isInitializing = true,
    this.addresses = const [],
    this.selectedAddressId,
    this.userType,
  });

  factory AppState.initial() => AppState(isInitializing: true);

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
    List<UserddressModel>? addresses,
    int? selectedAddressId,
  }) {
    return AppState(
      user: user ?? this.user,
      themeMode: themeMode ?? this.themeMode,
      isOnline: isOnline ?? this.isOnline,
      isInitializing: isInitializing ?? this.isInitializing,
      userType: role ?? userType,
      addresses: addresses ?? this.addresses,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
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
