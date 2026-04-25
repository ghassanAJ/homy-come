import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:orders/src/enum/filter_order_enum.dart';
import 'package:util/util.dart';

@Injectable(as: OrdersRepository, env: ['mock'])
class MockBookingApiRepository implements OrdersRepository {
  bool failNextGetMyOrderData = false;
  bool failDetailsOrderData = false;
  bool canceltedOrderData = false;
  bool failTodayScheduleData = false;
  List<TodaySchaduleModelResponse> allSchedule = [
    TodaySchaduleModelResponse(
      id: 1,
      time: '12:12 PM',
      address: 'kafarsousah, damascus ,syria',
      cleanerInfo: ProviderModel(
        id: 5,
        name: 'Ghassan',
        rating: 5.0,
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
        numberPhone: '963991212193',
      ),
      date: '27 tue, Des',
    ),
    TodaySchaduleModelResponse(
      id: 2,
      time: '07:30 PM',
      address: '125,2nd Street, California ,19288',
      cleanerInfo: ProviderModel(
        id: 5,
        name: 'Maya Ali',
        rating: 5.0,
        numberPhone: '963991212193',
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
      ),
      date: '27 tue, Des',
    ),
    TodaySchaduleModelResponse(
      id: 3,
      time: '11:30 PM',
      address: '125,2nd Street, California ,19288',
      cleanerInfo: ProviderModel(
        id: 5,
        name: 'Kamel',
        rating: 5.0,
        numberPhone: '963991212193',
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
      ),
      date: '27 tue, Des',
    ),
  ];
  List<BookingModelResponse> all = [
    BookingModelResponse(
      id: 101,
      serviceType: 'Deep cleaning',
      status: OrderStatus.scheduled,
      provider: ProviderModel(
        id: 5,
        name: 'kamel',
        rating: 0.5,
        numberPhone: '963991212193',
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
      ),
      date: '27 tue, Des',
      time: '44:30 AM',
      address: 'kafarsousah ,damascus ,syria',
    ),
    BookingModelResponse(
      id: 120,
      serviceType: 'Deep cleaning',
      status: OrderStatus.inProgress,
      provider: ProviderModel(
        id: 5,
        name: 'Jameel',
        rating: 0.5,
        numberPhone: '96399121299',
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
      ),
      date: '27 tue, Des',
      time: '03:30 AM',
      address: 'Dubai,123 street',
    ),
    BookingModelResponse(
      id: 102,
      serviceType: 'Cleaner',
      status: OrderStatus.scheduled,
      provider: ProviderModel(
        id: 5,
        name: 'ghassan',
        rating: 5.0,
        numberPhone: '963991212193',
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
      ),
      date: '27 tue, Des',
      time: '11:30 AM',
      address: 'kafarsousah ,damascus ,syria',
    ),
    BookingModelResponse(
      id: 103,
      serviceType: 'Cleaner',
      status: OrderStatus.completed,
      provider: ProviderModel(
        id: 5,
        name: 'ghassan',
        rating: 5.0,
        numberPhone: '963991212193',
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
      ),
      date: '27 tue, Des',
      time: '11:30 AM',
      address: 'kafarsousah ,damascus ,syria',
    ),
    BookingModelResponse(
      id: 101,
      serviceType: 'Deep cleaning',
      status: OrderStatus.completed,
      provider: ProviderModel(
        id: 5,
        name: 'kamel',
        rating: 4.3,
        numberPhone: '963991212193',
        image:
            'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
      ),
      date: '2 tue, Des',
      time: '03:00 PM',
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

    await Future.delayed(const Duration(milliseconds: 500));
    switch (status) {
      case FilterOrder.all:
        return success(all);
      case FilterOrder.completed:
        return success(all.where((e) => e.status == 'Completed').toList());
      case FilterOrder.scheduled:
        return success(all.where((e) => e.status == 'Scheduled').toList());
      case FilterOrder.in_progress:
        return success(all.where((e) => e.status == 'In Progress').toList());
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

    await Future.delayed(const Duration(milliseconds: 500));
    return success(
      BookingDetailseModelResponse(
        id: 103,
        serviceType: 'Cleaner',
        status: 'In Progress',
        provider: ProviderModel(
          id: 5,
          name: 'Ghassan',
          rating: 5.0,
          image:
              'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
          numberPhone: '963991212193',
        ),
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
  Future<Result<bool, APIException>> changeOrderStatus(
    int id,
    String reason,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return success(true);
  }

  @override
  Future<Result<List<TodaySchaduleModelResponse>, APIException>>
  getTodayScheduleData() async {
    if (canceltedOrderData) {
      failTodayScheduleData = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }
    await Future.delayed(const Duration(milliseconds: 500));
    return success(allSchedule);
  }

  @override
  Future<Result<TodaySchaduleModelResponse, APIException>> getOrderDetailsById(
    int id,
  ) async {
    if (canceltedOrderData) {
      failTodayScheduleData = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }
    await Future.delayed(const Duration(milliseconds: 500));
    var index = allSchedule.indexWhere((item) => item.id == id);
    return success(allSchedule[index == -1 ? 0 : index]);
  }
}
