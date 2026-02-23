import 'package:equatable/equatable.dart';

import 'res/user_model.dart';

class SessionModel extends Equatable {
  final String accessToken;
  final String refreshToken;
  final UserModel? user;

  const SessionModel({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  factory SessionModel.fromTokens({
    required String accessToken,
    required String refreshToken,
  }) {
    return SessionModel(accessToken: accessToken, refreshToken: refreshToken);
  }

  SessionModel withUser(UserModel user) {
    return SessionModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }

  bool get hasUser => user != null;

  bool get isProfileComplete => hasUser && user!.hasCompletedProfile;

  @override
  List<Object?> get props => [accessToken, refreshToken, user];
}
