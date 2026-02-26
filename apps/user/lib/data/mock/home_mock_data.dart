import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:user/data/model/home_content.dart';

final HomeContent homeMockContent = HomeContent(
  offers: const [
    HomeOfferItem(
      image: 'https://i.ibb.co/9m8XQCvr/image.png',
      aspectRatio: 2 / 1,
    ),
    HomeOfferItem(
      image: 'https://i.ibb.co/9m8XQCvr/image.png',
      aspectRatio: 2 / 1,
    ),
  ],
  categories: [
    HomeCategoryItem(
      title: 'Carpenter',
      description: '20 Services',
      iconPath: Assets.icons.carpenter,
    ),
    HomeCategoryItem(
      title: 'Cleaner',
      description: '20 Services',
      iconPath: Assets.icons.cleaner,
    ),
    HomeCategoryItem(
      title: 'Painter',
      description: '20 Services',
      iconPath: Assets.icons.painter,
    ),
    HomeCategoryItem(
      title: 'Electrician',
      description: '20 Services',
      iconPath: Assets.icons.electrician,
    ),
    HomeCategoryItem(
      title: 'Plumber',
      description: '20 Services',
      iconPath: Assets.icons.plumber,
    ),
  ],
  stories: [
    HomeStoryItem(
      title: 'Plumbing',
      discount: 'Save 30%',
      description: 'ORDER NOW',
      background: Color(0xFFA8D4F8),
      backgroundContainer: UIColor.vividBlue,
      iconPath: Assets.icons.paintingService,
    ),
    HomeStoryItem(
      title: 'Electrician',
      discount: '20% Off',
      description: 'ORDER NOW',
      background: Color(0xFFC9E9B6),
      backgroundContainer: UIColor.vividGreen,
      iconPath: Assets.icons.shiftingService,
    ),
    HomeStoryItem(
      title: 'Painting',
      discount: 'Save 30%',
      description: 'ORDER NOW',
      background: Color(0xFFF3B7D1),
      backgroundContainer: UIColor.vividPink,
      iconPath: Assets.icons.vehicleService,
    ),
  ],
  generalServices: const [
    HomeServiceItem(
      title: 'Home Cleaning',
      imageUrl: 'https://i.ibb.co/vCPn6j6p/Home-Cleaning.jpg',
    ),
    HomeServiceItem(
      title: 'Furniture Cleaning',
      imageUrl: 'https://i.ibb.co/ynSmvwph/Furniture-Cleaning.jpg',
    ),
    HomeServiceItem(
      title: 'Home Deep Clean',
      imageUrl: 'https://i.ibb.co/YFcNnFFp/Home-Deep-Cleaning.jpg',
    ),
  ],
  plumberServices: const [
    HomeServiceItem(
      title: 'Plumber service',
      imageUrl: 'https://i.ibb.co/7tgS7hR6/Plumber-service-1.jpg',
    ),
    HomeServiceItem(
      title: 'Plumber service',
      imageUrl: 'https://i.ibb.co/60qkN4rT/Plumber-service-2.jpg',
    ),
    HomeServiceItem(
      title: 'Plumber service',
      imageUrl: 'https://i.ibb.co/5hMPMkFj/Plumber-service-3.jpg',
    ),
  ],
  serviceOffers: const [
    HomeServiceOfferItem(
      imageUrl: 'https://i.ibb.co/Q7LbN1HF/Complete-Kitchen-Cleaning.png',
      title: 'Complete Kitchen Cleaning',
      price: '\$150',
      oldPrice: '\$180',
      reviewsCount: 130,
      ratingStars: [true, true, true, true, true],
    ),
    HomeServiceOfferItem(
      imageUrl: 'https://i.ibb.co/Q7LbN1HF/Complete-Kitchen-Cleaning.png',
      title: 'Kitchen Deep Cleaning',
      price: '\$140',
      oldPrice: '\$170',
      reviewsCount: 98,
      ratingStars: [true, true, true, true, false],
    ),
  ],
);
