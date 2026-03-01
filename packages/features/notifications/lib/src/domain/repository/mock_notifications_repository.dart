import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:notifications/src/domain/repository/notifications_repository.dart';
import 'package:util/util.dart';

class MockNotificationsRepository implements NotificationsRepository {
  @override
  Future<Result<List<NotificationItemModel>, APIException>>
  fetchNotifications() async {
    await Future.delayed(const Duration(seconds: 1));

    final mockNow = DateTime.now();

    return success([
      NotificationItemModel(
        id: '1',
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
        timeAgo: '15 min ago.',
        createdAt: mockNow.subtract(const Duration(minutes: 15)),
        isHighlighted: true,
      ),
      NotificationItemModel(
        id: '2',
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
        timeAgo: '25 min ago.',
        createdAt: mockNow.subtract(const Duration(minutes: 25)),
      ),
      NotificationItemModel(
        id: '3',
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
        timeAgo: '15 min ago.',
        createdAt: mockNow.subtract(const Duration(days: 1, minutes: 15)),
        isHighlighted: true,
      ),
      NotificationItemModel(
        id: '4',
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
        timeAgo: '25 min ago.',
        createdAt: mockNow.subtract(const Duration(days: 1, minutes: 25)),
      ),
      NotificationItemModel(
        id: '5',
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
        timeAgo: '25 min ago.',
        createdAt: mockNow.subtract(const Duration(days: 1, hours: 2)),
      ),
      NotificationItemModel(
        id: '6',
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
        timeAgo: '25 min ago.',
        createdAt: mockNow.subtract(const Duration(days: 1, hours: 4)),
      ),
      NotificationItemModel(
        id: '7',
        title: 'Payment confirm',
        description:
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
        timeAgo: '25 min ago.',
        createdAt: mockNow.subtract(const Duration(days: 1, hours: 5)),
      ),
    ]);
  }
}
