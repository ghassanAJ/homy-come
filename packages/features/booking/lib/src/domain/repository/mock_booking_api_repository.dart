import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:util/util.dart';

@Injectable(as: BookingRepository, env: ['mock'])
class MockBookingRepository implements BookingRepository {
  bool failNextGetServiceDetails = false;

  @override
  Future<Result<ServiceDetailsResponseModel, APIException>> getServiceDetails(
    GetServiceDetailsRequestModel request,
  ) async {
    if (failNextGetServiceDetails) {
      failNextGetServiceDetails = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }

    await Future.delayed(const Duration(seconds: 2));
    return success(
      ServiceDetailsResponseModel(
        id: request.serviceId,
        title: 'Home Deep Cleaning',
        categories: const [
          ServiceCategoryModel(id: '1', name: 'Home Cleaning'),
          ServiceCategoryModel(id: '2', name: 'Furniture Cleaning'),
          ServiceCategoryModel(id: '3', name: 'Home Deep Cleaning'),
        ],
        featuredOption: const ServiceOptionModel(
          id: 'featured-1',
          title: 'Door Lock install/Repair (1Look)',
          durationMinutes: 60,
          description:
              'Reliable Door lock installation & repair for improved home safety & function',
          originalPrice: 78,
          discountedPrice: 48,
        ),
        sections: const [
          ServiceSectionModel(
            title: 'Plumbing Services',
            options: [
              ServiceOptionModel(
                id: 'opt-1',
                title: 'Door Lock install/Repair (1Look)',
                durationMinutes: 60,
                description:
                    'Reliable Door lock installation & repair for improved home safety & function',
                originalPrice: 78,
                discountedPrice: 48,
              ),
              ServiceOptionModel(
                id: 'opt-2',
                title: 'Door Lock install/Repair (1Look)',
                durationMinutes: 60,
                description:
                    'Reliable Door lock installation & repair for improved home safety & function',
                originalPrice: 78,
                discountedPrice: 48,
              ),
            ],
          ),
          ServiceSectionModel(
            title: 'Cleaning Services',
            options: [
              ServiceOptionModel(
                id: 'opt-3',
                title: 'Home Cleaning',
                durationMinutes: 60,
                description:
                    'Reliable Door lock installation & repair for improved home safety & function',
                originalPrice: 78,
                discountedPrice: 48,
              ),
              ServiceOptionModel(
                id: 'opt-4',
                title: 'Furniture Cleaning',
                durationMinutes: 60,
                description:
                    'Reliable Door lock installation & repair for improved home safety & function',
                originalPrice: 78,
                discountedPrice: 48,
              ),
            ],
          ),
          ServiceSectionModel(
            title: 'Deep Cleaning Services',
            options: [
              ServiceOptionModel(
                id: 'opt-5',
                title: 'Home Deep Cleaning',
                durationMinutes: 60,
                description:
                    'Reliable Door lock installation & repair for improved home safety & function',
                originalPrice: 78,
                discountedPrice: 48,
              ),
              ServiceOptionModel(
                id: 'opt-6',
                title: 'Home Deep Cleaning',
                durationMinutes: 60,
                description:
                    'Reliable Door lock installation & repair for improved home safety & function',
                originalPrice: 78,
                discountedPrice: 48,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
