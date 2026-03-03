import 'package:api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:notifications/src/data/api/notifications_api.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:util/util.dart';

abstract class NotificationsRepository {
  Future<Result<List<NotificationItemModel>, APIException>>
  fetchNotifications();
}

@Injectable(as: NotificationsRepository, env: ['prod', 'dev'])
class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl(this._notificationsAPI);

  final NotificationsAPI _notificationsAPI;

  @override
  Future<Result<List<NotificationItemModel>, APIException>>
  fetchNotifications() async => _notificationsAPI.getNotifications().toResult();
}
