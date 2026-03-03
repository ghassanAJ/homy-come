import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:orders/src/domain/useCase/get_order_details_use_case.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:util/util.dart';

@Injectable(as: OrdersRepository, env: ['mock'])
class MockBookingApiRepository implements OrdersRepository {
  bool failNextGetMyOrderData = false;
  bool failDetailsOrderData = false;
  bool canceltedOrderData = false;
  List<BookingModelResponse> all = [
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
      id: 102,
      serviceType: 'Cleaner',
      status: 'in_progress',
      provider: ProviderModel(id: 5, name: 'ghassan', rating: 5.0),
      date: '27 tue, Des',
      time: '11:30 AM',
      address: 'kafarsousah ,damascus ,syria',
    ),
    BookingModelResponse(
      id: 103,
      serviceType: 'completed',
      status: 'in_progress',
      provider: ProviderModel(id: 5, name: 'ghassan', rating: 5.0),
      date: '27 tue, Des',
      time: '11:30 AM',
      address: 'kafarsousah ,damascus ,syria',
    ),
  ];
  @override
  Future<Result<List<BookingModelResponse>, APIException>> getMyOrder(
    FilterOrder status,
  ) async {
    if (failNextGetMyOrderData) {
      failNextGetMyOrderData = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }

    await Future.delayed(const Duration(seconds: 5));
    switch (status) {
      case FilterOrder.all:
        return success(all);
      case FilterOrder.completed:
        return success(all.where((e) => e.status == 'completed').toList());
      case FilterOrder.scheduled:
        return success(all.where((e) => e.status == 'scheduled').toList());
      case FilterOrder.in_progress:
        return success(all.where((e) => e.status == 'in_progress').toList());
    }
  }

  @override
  Future<Result<BookingDetailseModelResponse, APIException>> getOrderDetails(
    int id,
  ) async {
    if (failDetailsOrderData) {
      failDetailsOrderData = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }

    await Future.delayed(const Duration(seconds: 5));
    return success(
      BookingDetailseModelResponse(
        id: 103,
        serviceType: 'completed',
        status: 'in_progress',
        provider: ProviderModel(id: 5, name: 'ghassan', rating: 5.0),
        date: '27 tue, Des',
        time: '11:30 AM',
        address: 'kafarsousah ,damascus ,syria',
        workingHour: 10,
        servicesCharge: 20,
        deepCleaning: 10,
      ),
    );
  }

  @override
  Future<Result<bool, APIException>> cancelOrder(int id, String reason) async {
    if (canceltedOrderData) {
      canceltedOrderData = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }
    var index = all.indexWhere((node) => node.id == id);
    all[index].copyWith(status: 'cancelted');
    await Future.delayed(const Duration(seconds: 1));
    return success(true);
  }
}
