import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/util.dart';

@Injectable(as: OrdersRepository, env: ['mock'])
class MockBookingApiRepository implements OrdersRepository {
  bool failNextGetMyOrderData = false;

  @override
  Future<Result<List<BookingModelResponse>, APIException>> getMyOrder() async {
    if (failNextGetMyOrderData) {
      failNextGetMyOrderData = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }

    await Future.delayed(const Duration(seconds: 5));
    return success([
      BookingModelResponse(
        id: 101,
        serviceType: 'Deep cleaning',
        status: 'scheduled',
        provider: ProviderModel(id: 5, name: 'kamel', rating: 0.5),
        date: '27 tue, Des',
        time: '44:30 AM',
        address: 'kafarsousah ,damascus ,syria',
      ),
      BookingModelResponse(
        id: 101,
        serviceType: 'Cleaner',
        status: 'in_progress',
        provider: ProviderModel(id: 5, name: 'ghassan', rating: 5.0),
        date: '27 tue, Des',
        time: '11:30 AM',
        address: 'kafarsousah ,damascus ,syria',
      ),
    ]);
  }
}
