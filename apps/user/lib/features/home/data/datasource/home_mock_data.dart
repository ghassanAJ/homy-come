import 'package:booking/booking.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';

/// Mock [HomeResponseModel] for development and testing.
HomeResponseModel get mockHomeResponseModel => HomeResponseModel(
  categories: _mockCategories,
  offers: _mockOffers,
  sliders: _mockSliders,
);

final List<ServiceCategoryModel> _mockCategories = [
  ServiceCategoryModel(
    id: '1',
    name: 'Carpenter',
    servicesCount: 20,
    imageUrl: null,
    servicePreviews: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          priceModel: ServicePriceModel(currentPrice: 100, newPrice: 150),
          id: '1',
          info: InfoModel(
            id: '1',
            name: 'Carpenter',
            image: 'https://i.ibb.co/vCPn6j6p/Home-Cleaning.jpg',
          ),
          reviewsCount: 10,
          rating: 5,
        ),
      ),
    ],
  ),
  ServiceCategoryModel(
    id: '2',
    name: 'Cleaner',
    servicesCount: 20,
    imageUrl: null,
    servicePreviews: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          priceModel: ServicePriceModel(currentPrice: 100, newPrice: 150),
          id: '1',
          info: InfoModel(
            id: '1',
            name: 'Cleaner',
            image: 'https://i.ibb.co/ynSmvwph/Furniture-Cleaning.jpg',
          ),
          reviewsCount: 10,
          rating: 5,
        ),
      ),
    ],
  ),
  ServiceCategoryModel(
    id: '3',
    name: 'Painter',
    servicesCount: 20,
    imageUrl: null,
    servicePreviews: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          priceModel: ServicePriceModel(currentPrice: 100, newPrice: 150),
          id: '1',
          info: InfoModel(
            id: '1',
            name: 'Painter',
            image: 'https://i.ibb.co/Q7LbN1HF/Complete-Kitchen-Cleaning.png',
          ),
          reviewsCount: 10,
          rating: 5,
        ),
      ),
    ],
  ),
  ServiceCategoryModel(
    id: '4',
    name: 'Electrician',
    servicesCount: 20,
    imageUrl: null,
    servicePreviews: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          priceModel: ServicePriceModel(currentPrice: 100, newPrice: 150),
          id: '1',
          info: InfoModel(
            id: '1',
            name: 'Electrician',
            image: 'https://i.ibb.co/YFcNnFFp/Home-Deep-Cleaning.jpg',
          ),
          reviewsCount: 10,
          rating: 5,
        ),
      ),
    ],
  ),
  ServiceCategoryModel(
    id: '5',
    name: 'Plumber',
    servicesCount: 20,
    imageUrl: null,
    servicePreviews: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          priceModel: ServicePriceModel(currentPrice: 100, newPrice: 150),
          id: '1',
          info: InfoModel(
            id: '1',
            name: 'Plumber',
            image: 'https://i.ibb.co/7tgS7hR6/Plumber-service-1.jpg',
          ),
          reviewsCount: 10,
          rating: 5,
        ),
      ),
    ],
  ),
];

final List<OfferModel> _mockOffers = [
  const OfferModel(
    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    serviceId: '1',
  ),
  const OfferModel(
    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    serviceId: '1',
  ),
];

final List<OfferModel> _mockSliders = [
  const OfferModel(
    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    serviceId: '1',
  ),
  const OfferModel(
    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    serviceId: '1',
  ),
  const OfferModel(
    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    serviceId: '1',
  ),
];

/// Mock [SearchResponseModel] for development and testing.
SearchResponseModel get mockSearchResponseModel => SearchResponseModel(
  popularSearch: _mockPopularSearch,
  topCategories: _mockCategories,
);

const List<String> _mockPopularSearch = [
  'Home Cleaning',
  'Painter',
  'Plumber',
  'Electrician',
  'Carpenter',
];
