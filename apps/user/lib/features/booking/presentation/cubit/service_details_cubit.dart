import 'package:booking/booking.dart';
import 'package:user/features/booking/domain/use_cases/get_service_details_use_case.dart';
import 'package:util/util.dart';

class ServiceDetailsCubit extends BaseScreenCubit<ServiceDetailsResponseModel> {
  ServiceDetailsCubit(this._repository);

  final BookingRepository _repository;

  Future<void> fetchServiceDetails({required String serviceId}) {
    return fetchData(
      useCase: GetServiceDetailsUseCase(
        _repository,
        GetServiceDetailsRequestModel(serviceId: serviceId),
      ),
    );
  }
}
