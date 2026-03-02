import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_api.g.dart';

class NotificationsAPIEndpoints {
  static const String notifications = '/api/v1/user/home/notifications';
}

@injectable
@RestApi()
abstract class NotificationsAPI {
  @factoryMethod
  factory NotificationsAPI(Dio dio) = _NotificationsAPI;

  @GET(NotificationsAPIEndpoints.notifications)
  Future<APIResponse<List<NotificationItemModel>>> getNotifications();
}
