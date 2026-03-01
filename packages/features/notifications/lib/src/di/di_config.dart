import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:notifications/src/data/api/notifications_api.dart';
import 'package:notifications/src/domain/repository/mock_notifications_repository.dart';
import 'package:notifications/src/domain/repository/notifications_repository.dart';

void initNotifications(GetIt getIt, String env) {
  if (!getIt.isRegistered<NotificationsAPI>()) {
    getIt.registerFactory<NotificationsAPI>(
      () => NotificationsAPI(getIt<Dio>()),
    );
  }

  if (getIt.isRegistered<NotificationsRepository>()) {
    getIt.unregister<NotificationsRepository>();
  }

  if (env == 'mock') {
    getIt.registerFactory<NotificationsRepository>(
      () => MockNotificationsRepository(),
    );
    return;
  }

  getIt.registerFactory<NotificationsRepository>(
    () => NotificationsRepositoryImpl(getIt<NotificationsAPI>()),
  );
}
