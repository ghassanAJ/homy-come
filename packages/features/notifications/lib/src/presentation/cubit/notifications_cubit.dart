import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:notifications/src/domain/use_cases/get_notifications_use_case.dart';
import 'package:notifications/src/domain/repository/notifications_repository.dart';
import 'package:util/util.dart';

class NotificationsCubit extends BaseScreenCubit<List<NotificationItemModel>> {
  NotificationsCubit(this._repository);

  final NotificationsRepository _repository;

  Future<void> fetchNotifications({bool refresh = false}) {
    return fetchData(
      useCase: GetNotificationsUseCase(_repository),
      refresh: refresh,
    );
  }
}
