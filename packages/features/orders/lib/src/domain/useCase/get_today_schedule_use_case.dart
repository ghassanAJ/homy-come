import 'package:injectable/injectable.dart';
import 'package:orders/src/data/models/res/today_schadule_model_response.dart';
import 'package:orders/src/domain/repository/booking_api_repository.dart';
import 'package:util/util.dart';

@injectable
class GetTodayScheduleUseCase
    extends BaseUseCase<List<TodaySchaduleModelResponse>> {
  final OrdersRepository _repo;

  GetTodayScheduleUseCase({required OrdersRepository repo}) : _repo = repo;
  @override
  Future<Result<List<TodaySchaduleModelResponse>, APIException>> call() async {
    return await _repo.getTodayScheduleData();
  }
}
