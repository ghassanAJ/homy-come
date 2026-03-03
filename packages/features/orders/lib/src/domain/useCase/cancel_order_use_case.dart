import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/util.dart';

class CancelOrderUseCase extends BaseUseCase<bool> {
  final OrdersRepository _repo;

  CancelOrderUseCase({required OrdersRepository repo, required this.id, required this.reason}) : _repo = repo;
  final int id;
  final String reason;
  @override
  Future<Result<bool, APIException>> call() async {
    return _repo.cancelOrder(id, reason);
  }
}
