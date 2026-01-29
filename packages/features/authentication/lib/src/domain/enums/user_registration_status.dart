enum UserRegistrationStatus {
  newUser('new'),
  returning('returning');

  const UserRegistrationStatus(this.value);

  final String value;

  static UserRegistrationStatus? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    return UserRegistrationStatus.values.cast<UserRegistrationStatus?>().firstWhere(
          (status) => status?.value == value,
          orElse: () => null,
        );
  }

  static UserRegistrationStatus parse(String value) {
    final result = tryParse(value);
    if (result == null) {
      throw ArgumentError.value(value, 'value', 'Invalid UserRegistrationStatus');
    }
    return result;
  }

  bool get isNew => this == UserRegistrationStatus.newUser;
  bool get isReturning => this == UserRegistrationStatus.returning;
}
