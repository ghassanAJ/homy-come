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

  static List<ServicePreviewResponseModel> _mockServicePreviews(String name) =>
      List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          id: '$index',
          info: InfoModel(
            id: '$index',
            name: '$name $index',
            image: 'https://i.ibb.co/9m8XQCvr/image.png',
          ),
          priceModel: ServicePriceModel(currentPrice: 100, newPrice: 150),
          rating: 5,
          reviewsCount: 10,
        ),
      );

  static List<OfferModel> get _mockOffer => [
    const OfferModel(
      imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
      serviceId: '1',
    ),
    const OfferModel(
      imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
      serviceId: '2',
    ),
    const OfferModel(
      imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
      serviceId: '3',
    ),
  ];

  @override
  Future<Result<HomeResponseModel, APIException>> getHomeContent() async {
    if (failNextGetHomeContent) {
      failNextGetHomeContent = false;
      return failure(APIException.error('Mock getHomeContent failure'));
    }
    return success(mockHomeResponseModel);
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
  Future<Result<List<ServicePreviewResponseModel>, APIException>>
  getCategoryServices(String categoryId) async {
    if (failNextGetCategoryServices) {
      failNextGetCategoryServices = false;
      return failure(APIException.error('Mock getCategoryServices failure'));
    }
    await Future.delayed(const Duration(milliseconds: 500));
    return success(_mockServicePreviews('Service'));
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
