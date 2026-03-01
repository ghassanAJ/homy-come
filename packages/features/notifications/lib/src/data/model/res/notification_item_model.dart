import 'package:util/util.dart';

class NotificationItemModel implements DateGroupable {
  const NotificationItemModel({
    this.id,
    required this.title,
    required this.description,
    required this.timeAgo,
    this.createdAt,
    this.isHighlighted = false,
  });

  final String? id;
  final String title;
  final String description;
  final String timeAgo;
  final DateTime? createdAt;
  final bool isHighlighted;

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      id: json['id']?.toString(),
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      timeAgo: json['time_ago'] as String? ?? '',
      createdAt: _parseDate(json['created_at']),
      isHighlighted: json['is_highlighted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'time_ago': timeAgo,
      'created_at': createdAt?.toUtc().toIso8601String(),
      'is_highlighted': isHighlighted,
    };
  }

  @override
  DateTime? get groupingDate => createdAt;

  static DateTime? _parseDate(Object? value) {
    if (value is DateTime) return value.toLocal();
    if (value is String) return DateTime.tryParse(value)?.toLocal();
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value).toLocal();
    }
    return null;
  }
}
