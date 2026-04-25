extension IntExtension on int {
  String get toWeekdayName {
    switch (this) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';

      default:
        return 'Invalid weekday';
    }
  }

  String get toMonthName {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'Jun',
      'July',
      'August',
      'Septmper',
      'Octobar',
      'Novmber',
      'Decmber',
    ];
    final indexOfMonth = this - 1 == -1 ? DateTime.now().month : this - 1;
    return months[indexOfMonth];
  }
}
