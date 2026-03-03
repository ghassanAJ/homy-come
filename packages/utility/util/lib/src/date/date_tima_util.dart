class DateTimaUtil {
  const DateTimaUtil._();

  static DateTime? createdAtFromJson(Object? value) {
    if (value is DateTime) return value.toLocal();
    if (value is String) return DateTime.tryParse(value)?.toLocal();
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value).toLocal();
    }
    return null;
  }

  static String? createdAtToJson(DateTime? value) {
    return value?.toUtc().toIso8601String();
  }
}
