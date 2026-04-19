import 'package:injectable/injectable.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/util.dart';
@injectable
class GetOrderDetailsByIdUseCase extends BaseUseCase {
  final OrdersRepository _repo;
  final int id;

  GetOrderDetailsByIdUseCase({
    required OrdersRepository repo,
    @factoryParam required this.id,
  }) : _repo = repo;
  @override
  Future<Result<dynamic, APIException>> call() async {
    return await _repo.getOrderDetailsById(id);
  }
}
