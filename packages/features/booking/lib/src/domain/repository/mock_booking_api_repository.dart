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

    await Future.delayed(const Duration(milliseconds: 500));
    return success(
      ServiceDetailsResponseModel(
        id: '1',
        rating: 5,
        reviewsCount: 10,
        info: InfoModel(
          id: '1',
          name: 'Home Deep Cleaning',
          image: 'https://i.ibb.co/9m8XQCvr/image.png',
        ),
        price: ServicePriceModel(currentPrice: 100, newPrice: 150),
        categories: const [
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
            services: [
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
            ],
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
            services: [
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
            ],
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
            services: [
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
            ],
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning1',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
            services: [
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
            ],
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning2',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
            services: [
              AddOnServiceModel(
                id: '1',
                documentId: '1',
                durationMinutes: 60,
                price: ServicePriceModel(currentPrice: 100, newPrice: 150),
                info: InfoModel(id: '1', name: 'Home Cleaning'),
              ),
            ],
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning3',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning4',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning5',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning6',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
          ),
          AddOnCategoryModel(
            id: '1',
            documentId: '1',
            info: InfoModel(
              id: '1',
              name: 'Home Cleaning7',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
          ),
        ],
      ),
    );
  }
}
