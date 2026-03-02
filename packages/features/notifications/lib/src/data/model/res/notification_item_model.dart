// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:util/util.dart';

part 'notification_item_model.freezed.dart';
part 'notification_item_model.g.dart';

@freezed
abstract class NotificationItemModel
    with _$NotificationItemModel
    implements DateGroupable {
  const NotificationItemModel._();

  const factory NotificationItemModel({
    String? id,
    required String title,
    required String description,
    @JsonKey(name: 'time_ago') required String timeAgo,
    @JsonKey(
      name: 'created_at',
      fromJson: _createdAtFromJson,
      toJson: _createdAtToJson,
    )
    DateTime? createdAt,
    @JsonKey(name: 'is_highlighted') @Default(false) bool isHighlighted,
  }) = _NotificationItemModel;

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemModelFromJson(json);

  @override
  DateTime? get groupingDate => createdAt;
}

DateTime? _createdAtFromJson(Object? value) {
  if (value is DateTime) return value.toLocal();
  if (value is String) return DateTime.tryParse(value)?.toLocal();
  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value).toLocal();
  }
  return null;
}

String? _createdAtToJson(DateTime? value) => value?.toUtc().toIso8601String();
