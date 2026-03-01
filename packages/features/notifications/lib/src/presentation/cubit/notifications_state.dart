import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:util/util.dart';

const _sentinel = Object();

class NotificationsState {
  const NotificationsState({
    this.isLoading = false,
    this.notifications = const <NotificationItemModel>[],
    this.error,
  });

  final bool isLoading;
  final List<NotificationItemModel> notifications;
  final APIException? error;

  NotificationsState copyWith({
    bool? isLoading,
    List<NotificationItemModel>? notifications,
    Object? error = _sentinel,
  }) {
    return NotificationsState(
      isLoading: isLoading ?? this.isLoading,
      notifications: notifications ?? this.notifications,
      error: identical(error, _sentinel) ? this.error : error as APIException?,
    );
  }
}
