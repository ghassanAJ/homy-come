import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:notifications/src/domain/repository/notifications_repository.dart';
import 'package:util/util.dart';

class GetNotificationsUseCase extends BaseUseCase<List<NotificationItemModel>> {
  GetNotificationsUseCase(this._repository);

  final NotificationsRepository _repository;

  @override
  Future<Result<List<NotificationItemModel>, APIException>> call() {
    return _repository.fetchNotifications();
  }
}
