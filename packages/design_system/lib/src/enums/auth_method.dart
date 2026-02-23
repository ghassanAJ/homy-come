enum AuthMethod {
  pin('pin'),
  email('email'),
  phone('phone'),
  google('google'),
  apple('apple');

  const AuthMethod(this.value);

  final String value;

  static AuthMethod? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    return AuthMethod.values.cast<AuthMethod?>().firstWhere(
          (method) => method?.value == value,
          orElse: () => null,
        );
  }

  static AuthMethod parse(String value) {
    final result = tryParse(value);
    if (result == null) {
      throw ArgumentError.value(value, 'value', 'Invalid AuthMethod');
    }
    return result;
  }

  bool get isPrimary => this == AuthMethod.pin || this == AuthMethod.email;
  bool get isSocial => this == AuthMethod.google || this == AuthMethod.apple;
  bool get isIdentity => this == AuthMethod.email || this == AuthMethod.phone;
}
