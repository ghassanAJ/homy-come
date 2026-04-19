enum UserRole {
  user('user'),
  driver('driver'),
  provider('provider');

  const UserRole(this.value);

  final String value;

  static UserRole? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    return UserRole.values.cast<UserRole?>().firstWhere(
      (role) => role?.value == value,
      orElse: () => null,
    );
  }

  static UserRole parse(String value) {
    final result = tryParse(value);
    if (result == null) {
      throw ArgumentError.value(value, 'value', 'Invalid UserRole');
    }
    return result;
  }

  bool get isUser => this == UserRole.user;
  bool get isDriver => this == UserRole.driver;
  bool get isProvider => this == UserRole.provider;
}
