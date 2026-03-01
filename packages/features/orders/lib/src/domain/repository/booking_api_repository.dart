import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:util/util.dart';
import 'package:api_client/api_client.dart';

abstract class OrdersRepository {
  Future<Result<List<BookingModelResponse>, APIException>> getMyOrder();
}
