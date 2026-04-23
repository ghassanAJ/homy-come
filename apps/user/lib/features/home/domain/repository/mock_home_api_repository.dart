import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/data/datasource/home_mock_data.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:util/util.dart';
//
//
//

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
              image: 'https://i.ibb.co/7tgS7hR6/Plumber-service-1.jpg',
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
          image: 'https://i.ibb.co/7tgS7hR6/Plumber-service-1.jpg',
        ),
        servicesCount: 8,
      );
  static List<OfferModel> get _mockStories => [
    const OfferModel(
      discountPercentage: 33,
      discountCode: 'Ndsads',
      imageUrl:
          'https://i.ibb.co/1t2TrD33/a709adca-5598-472d-a961-609645790545.jpg',
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
      discountPercentage: 44,
      discountCode: 'CDsdaDF',
      imageUrl:
          'https://i.ibb.co/Hpdx226Z/c6b0414f-c76b-4dcf-9793-4ce0537c1ef9.jpg',
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
      discountPercentage: 35,
      discountCode: 'KvfdsfKK',
      imageUrl: 'https://i.ibb.co/q3wYp1w8/11688038.jpg',
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
      discountPercentage: 55,
      discountCode: 'Jfudsf',
      imageUrl: 'https://i.ibb.co/WpMxY0xC/10813121.jpg',
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

    // const OfferModel(
    //   imageUrl: 'https://ibb.co/whVvjwY2',
    //   service: ServicePreviewResponseModel(
    //     documentId: '3',
    //     priceModel: ServicePriceModel(
    //       currentPrice: 100,
    //       newPrice: 150,
    //       currency: 'AED',
    //       id: 3,
    //     ),
    //     rating: 5,
    //     reviewsCount: 10,
    //     id: 3,
    //     info: InfoModel(id: 3, name: 'Service 3'),
    //   ),
    // ),
  ];

  static List<OfferModel> get _mockOffer => [
    const OfferModel(
      discountPercentage: 67,
      discountCode: 'Udsdasd',
      imageUrl: 'https://i.ibb.co/rGxkckqV/9667729.jpg',
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
      discountPercentage: 82,
      discountCode: 'Ldsfc234',
      imageUrl: 'https://i.ibb.co/dh3t2Tc/4302409.jpg',
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
    const OfferModel(
      discountPercentage: 72,
      discountCode: 'Ujfsdasd',
      imageUrl: 'https://i.ibb.co/KcZBqKy7/17537.jpg',
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
  Future<Result<SearchResponseModel, APIException>> getSearchContent(
    String qwery,
  ) async {
    await Future.delayed(Duration(milliseconds: 500));
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

  @override
  Future<Result<List<OfferModel>, APIException>> getStories() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return success(_mockStories);
  }
}
