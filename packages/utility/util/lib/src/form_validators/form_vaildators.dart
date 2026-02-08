mixin FormValidators {
  int _calculateAge(DateTime selectedDate) {
    final now = DateTime.now();
    int age = now.year - selectedDate.year;

    if (now.month < selectedDate.month ||
        (now.month == selectedDate.month && now.day < selectedDate.day)) {
      age--;
    }
    return age;
  }

  String? validateChildAge(
    DateTime? selectedDate, {
    required String messageWhenDateEmpty,
    required String messageWhenChildAgeNotInRange,
    required String messageWhenInvalid,
    int minAge = 0,
    int maxAge = 18,
  }) {
    if (selectedDate == null) return messageWhenDateEmpty;

    final age = _calculateAge(selectedDate);

    if (age < minAge || age >= maxAge) {
      return messageWhenChildAgeNotInRange;
    }

    if (age < 0) return messageWhenInvalid;

    return null;
  }

  String? validateParentAge(
    DateTime? selectedDate, {
    required String messageWhenDateEmpty,
    required String messageWhenParentAgeNotInRange,
    required String messageWhenInvalid,
    int minAge = 18,
    int maxAge = 100,
  }) {
    if (selectedDate == null) return messageWhenDateEmpty;

    final age = _calculateAge(selectedDate);

    if (age < minAge || age >= maxAge) {
      return messageWhenParentAgeNotInRange;
    }

    if (age < 0) return messageWhenInvalid;

    return null;
  }
}
