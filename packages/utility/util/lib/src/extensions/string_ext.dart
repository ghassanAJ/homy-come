import 'package:intl/intl.dart';

extension TaskStatusStringExtension on String {
  String get toSubmittedDate {
    try {
      final date = DateTime.parse(this).toLocal(); // convert from UTC to local
      final formatted = DateFormat('MMM d, yyyy').format(date);
      return 'Submitted $formatted';
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get toFormattedDate {
    try {
      final date = DateTime.tryParse(this)?.toLocal();
      if (date == null) return '';
      return DateFormat('MMM d, yyyy').format(date);
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get toFormattedDateWithoyYear {
    try {
      final date = DateTime.tryParse(this)?.toLocal();
      if (date == null) return '';
      return DateFormat('MMM d').format(date);
    } catch (e) {
      return 'Invalid date';
    }
  }
}
