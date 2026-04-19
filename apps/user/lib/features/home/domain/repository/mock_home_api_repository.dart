import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/datasource/home_mock_data.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:util/util.dart';

/// Mock implementation of [HomeRepository] for testing and development.
///
/// Returns successful results with fake data. Set [failNextGetHomeContent],
/// [failNextGetSearchContent], etc. to true to simulate failures on the next call.
///
/// Registered only when running with [ENV]=mock.
@Injectable(as: HomeRepository, env: ['mock'])
class MockHomeRepository implements HomeRepository {
  MockHomeRepository();

  bool failNextGetHomeContent = false;
  bool failNextGetSearchContent = false;
  bool failNextGetCategoryServices = false;
  bool failNextGetOffers = false;
  bool failNextGetSliders = false;

  static ServiceCategoryModel _mockServiceCategory(String name) =>
      ServiceCategoryModel(
        services: List.generate(
          8,
          (index) => ServicePreviewResponseModel(
            documentId: '$name-$index',
            id: index,
            info: InfoModel(
              id: index,
              name: '$name $index',
              image: 'https://i.ibb.co/9m8XQCvr/image.png',
            ),
            priceModel: ServicePriceModel(
              currentPrice: 100,
              newPrice: 150,
              currency: 'AED',
              id: index,
            ),
            rating: 5,
            reviewsCount: 10,
          ),
        ),
        documentId: name,
        id: 1,
        info: InfoModel(
          id: 1,
          name: name,
          image: 'https://i.ibb.co/9m8XQCvr/image.png',
        ),
        servicesCount: 8,
      );

  static List<OfferModel> get _mockOffer => [
    const OfferModel(
      imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
      service: ServicePreviewResponseModel(
        priceModel: ServicePriceModel(
          currentPrice: 100,
          newPrice: 150,
          currency: 'AED',
          id: 1,
        ),
        rating: 5,
        reviewsCount: 10,
        documentId: '1',
        id: 1,
        info: InfoModel(id: 1, name: 'Service 1'),
      ),
    ),
    const OfferModel(
      imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
      service: ServicePreviewResponseModel(
        priceModel: ServicePriceModel(
          currentPrice: 100,
          newPrice: 150,
          currency: 'AED',
          id: 2,
        ),
        rating: 5,
        reviewsCount: 10,
        documentId: '2',
        id: 2,
        info: InfoModel(id: 2, name: 'Service 2'),
      ),
    ),
    const OfferModel(
      imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
      service: ServicePreviewResponseModel(
        documentId: '3',
        priceModel: ServicePriceModel(
          currentPrice: 100,
          newPrice: 150,
          currency: 'AED',
          id: 3,
        ),
        rating: 5,
        reviewsCount: 10,
        id: 3,
        info: InfoModel(id: 3, name: 'Service 3'),
      ),
    ),
  ];

  @override
  Future<Result<List<ServiceCategoryModel>, APIException>>
  getCategories() async {
    if (failNextGetHomeContent) {
      failNextGetHomeContent = false;
      return failure(APIException.error('Mock getHomeContent failure'));
    }
    return success(mockCategories);
  }

  @override
  Future<Result<SearchResponseModel, APIException>> getSearchContent() async {
    if (failNextGetSearchContent) {
      failNextGetSearchContent = false;
      return failure(APIException.error('Mock getSearchContent failure'));
    }
    return success(mockSearchResponseModel);
  }

  @override
  Future<Result<ServiceCategoryModel, APIException>> getCategoryServices(
    String categoryId,
  ) async {
    if (failNextGetCategoryServices) {
      failNextGetCategoryServices = false;
      return failure(APIException.error('Mock getCategoryServices failure'));
    }
    await Future.delayed(const Duration(milliseconds: 500));
    return success(_mockServiceCategory('Service'));
  }

  @override
  Future<Result<List<OfferModel>, APIException>> getOffers() async {
    if (failNextGetOffers) {
      failNextGetOffers = false;
      return failure(APIException.error('Mock getOffers failure'));
    }
    await Future.delayed(const Duration(milliseconds: 500));
    return success(_mockOffer);
  }

  @override
  Future<Result<List<OfferModel>, APIException>> getSliders() async {
    if (failNextGetSliders) {
      failNextGetSliders = false;
      return failure(APIException.error('Mock getSliders failure'));
    }
    await Future.delayed(const Duration(milliseconds: 500));

    return success(_mockOffer);
  }
}
