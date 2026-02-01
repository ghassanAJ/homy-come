import 'res/user_model.dart';

class Session {
  final String accessToken;
  final String refreshToken;
  final UserModel? user;

  const Session({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  factory Session.fromTokens({
    required String accessToken,
    required String refreshToken,
  }) {
    return Session(accessToken: accessToken, refreshToken: refreshToken);
  }

  Session withUser(UserModel user) {
    return Session(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }

  bool get hasUser => user != null;

  bool get isProfileComplete => hasUser && user!.hasCompletedProfile;
}
