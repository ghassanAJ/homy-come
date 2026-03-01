import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';

class NotificationsAPIEndpoints {
  static const String notifications = '/api/v1/user/home/notifications';
}

class NotificationsAPI {
  NotificationsAPI(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<APIResponse<List<NotificationItemModel>>> getNotifications() async {
    final response = await _dio.get<Map<String, dynamic>>(
      NotificationsAPIEndpoints.notifications,
    );

    final responseJson = response.data ?? <String, dynamic>{};

    return APIResponse.fromJson(
      responseJson,
      (json) => _toList(json, NotificationItemModel.fromJson),
    );
  }

  List<T> _toList<T>(
    Object? json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final list = json as List<dynamic>? ?? const <dynamic>[];
    return list.map((item) => fromJson(item as Map<String, dynamic>)).toList();
  }
}
