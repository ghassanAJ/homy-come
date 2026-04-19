import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:util/util.dart';
import 'package:api_client/api_client.dart';

abstract class OrdersRepository {
  Future<Result<List<BookingModelResponse>, APIException>> getMyOrder(
    FilterOrder filter,
  );

  Future<Result<BookingDetailseModelResponse, APIException>> getOrderDetails(
    int id,
  );
  Future<Result<bool, APIException>> cancelOrder(int id, String reason);

  Future<Result<List<TodaySchaduleModelResponse>, APIException>>
  getTodayScheduleData();
  Future<Result<TodaySchaduleModelResponse, APIException>>
  getOrderDetailsById(int id);
}
