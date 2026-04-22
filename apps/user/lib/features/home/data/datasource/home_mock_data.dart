import 'package:booking/booking.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/data/model/res/search_response_model.dart';

/// Mock [HomeResponseModel] for development and testing.

final List<ServiceCategoryModel> mockCategories = [
  ServiceCategoryModel(
    documentId: '1',
    id: 1,
    info: InfoModel(
      id: 1,
      name: 'Carpenter',
      image: 'https://i.ibb.co/vCPn6j6p/Home-Cleaning.jpg',
    ),
    servicesCount: 20,

    services: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          documentId: '1-$index',
          priceModel: ServicePriceModel(
            currentPrice: 100,
            newPrice: 150,
            currency: 'AED',
            id: 1,
          ),
          id: 1,
          info: InfoModel(
            id: 1,
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
    documentId: '2',
    id: 2,
    info: InfoModel(
      id: 2,
      name: 'Cleaner',
      image: 'https://i.ibb.co/ynSmvwph/Furniture-Cleaning.jpg',
    ),
    servicesCount: 20,
    services: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          documentId: '2-$index',
          priceModel: ServicePriceModel(
            currentPrice: 100,
            newPrice: 150,
            currency: 'AED',
            id: 1,
          ),
          id: 1,
          info: InfoModel(
            id: 1,
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
    documentId: '3',
    id: 3,
    info: InfoModel(
      id: 3,
      name: 'Painter',
      image: 'https://i.ibb.co/Q7LbN1HF/Complete-Kitchen-Cleaning.png',
    ),
    servicesCount: 20,
    services: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          documentId: '3-$index',
          priceModel: ServicePriceModel(
            currentPrice: 100,
            newPrice: 150,
            currency: 'AED',
            id: 1,
          ),
          id: 1,
          info: InfoModel(
            id: 1,
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
    documentId: '4',
    id: 4,
    info: InfoModel(
      id: 4,
      name: 'Electrician',
      image: 'https://i.ibb.co/YFcNnFFp/Home-Deep-Cleaning.jpg',
    ),
    servicesCount: 20,
    services: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          documentId: '4-$index',
          priceModel: ServicePriceModel(
            currentPrice: 100,
            newPrice: 150,
            currency: 'AED',
            id: 1,
          ),
          id: 1,
          info: InfoModel(
            id: 1,
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
    documentId: '5',
    id: 5,
    info: InfoModel(
      id: 5,
      name: 'Plumber',
      image: 'https://i.ibb.co/7tgS7hR6/Plumber-service-1.jpg',
    ),
    servicesCount: 20,
    services: [
      ...List.generate(
        8,
        (index) => ServicePreviewResponseModel(
          documentId: '5-$index',
          priceModel: ServicePriceModel(
            currentPrice: 100,
            newPrice: 150,
            currency: 'AED',
            id: 1,
          ),
          id: 1,
          info: InfoModel(
            id: 1,
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
    service: ServicePreviewResponseModel(
      rating: 5,
      reviewsCount: 10,
      id: 1,
      info: InfoModel(id: 1, name: 'Service 1'),
      documentId: '1',
      priceModel: ServicePriceModel(
        currentPrice: 100,
        newPrice: 150,
        currency: 'AED',
        id: 1,
      ),
    ),
    discountPercentage: 44,
    discountCode: 'SdfSAfa',
  ),
  const OfferModel(
    discountPercentage: 55,
    discountCode: 'Csadfsfd',
    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    service: ServicePreviewResponseModel(
      rating: 5,
      reviewsCount: 10,

      id: 1,
      info: InfoModel(id: 1, name: 'Service 1'),
      documentId: '1',
      priceModel: ServicePriceModel(
        currentPrice: 100,
        newPrice: 150,
        currency: 'AED',
        id: 1,
      ),
    ),
  ),
];

final List<OfferModel> _mockSliders = [
  const OfferModel(
    discountPercentage: 22,
    discountCode: 'Asddsddsf',

    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',

    service: ServicePreviewResponseModel(
      documentId: '1',
      rating: 5,
      reviewsCount: 10,
      id: 1,
      info: InfoModel(id: 1, name: 'Service 1'),
      priceModel: ServicePriceModel(
        currentPrice: 100,
        newPrice: 150,
        currency: 'AED',
        id: 1,
      ),
    ),
  ),
  const OfferModel(
    discountPercentage: 88,
    discountCode: 'Kdcsaccsd',

    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    service: ServicePreviewResponseModel(
      rating: 5,
      reviewsCount: 10,
      id: 1,
      info: InfoModel(id: 1, name: 'Service 1'),
      documentId: '1',
      priceModel: ServicePriceModel(
        currentPrice: 100,
        newPrice: 150,
        currency: 'AED',
        id: 1,
      ),
    ),
  ),
  const OfferModel(
    discountPercentage: 33,
    discountCode: 'Ndsads',
    imageUrl: 'https://i.ibb.co/9m8XQCvr/image.png',
    service: ServicePreviewResponseModel(
      rating: 5,
      reviewsCount: 10,
      id: 1,
      info: InfoModel(id: 1, name: 'Service 1'),
      documentId: '1',
      priceModel: ServicePriceModel(
        currentPrice: 100,
        newPrice: 150,
        currency: 'AED',
        id: 1,
      ),
    ),
  ),
];

/// Mock [SearchResponseModel] for development and testing.
SearchResponseModel get mockSearchResponseModel => SearchResponseModel(
  popularSearch: _mockPopularSearch,
  topCategories: mockCategories,
);

const List<String> _mockPopularSearch = [
  'Home Cleaning',
  'Painter',
  'Plumber',
  'Electrician',
  'Carpenter',
];
