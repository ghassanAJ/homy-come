enum Gender {
  male('male'),
  female('female');

  const Gender(this.value);

  final String value;

  static Gender? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    return Gender.values.cast<Gender?>().firstWhere(
          (gender) => gender?.value == value,
          orElse: () => null,
        );
  }

  static Gender parse(String value) {
    final result = tryParse(value);
    if (result == null) {
      throw ArgumentError.value(value, 'value', 'Invalid Gender');
    }
    return result;
  }

  bool get isMale => this == Gender.male;
  bool get isFemale => this == Gender.female;
}
