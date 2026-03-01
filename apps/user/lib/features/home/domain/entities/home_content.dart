import 'package:flutter/material.dart';

class HomeContent {
  const HomeContent({
    required this.offers,
    required this.categories,
    required this.stories,
    required this.generalServices,
    required this.plumberServices,
    required this.serviceOffers,
  });

  final List<HomeOfferItem> offers;
  final List<HomeCategoryItem> categories;
  final List<HomeStoryItem> stories;
  final List<HomeServiceItem> generalServices;
  final List<HomeServiceItem> plumberServices;
  final List<HomeServiceOfferItem> serviceOffers;
}

class HomeOfferItem {
  const HomeOfferItem({
    required this.image,
    this.aspectRatio = 2 / 1,
    this.package,
  });

  final String image;
  final String? package;
  final double aspectRatio;
}

class HomeCategoryItem {
  const HomeCategoryItem({
    required this.title,
    required this.description,
    required this.iconPath,
  });

  final String title;
  final String description;
  final String iconPath;
}

class HomeStoryItem {
  const HomeStoryItem({
    required this.title,
    required this.discount,
    required this.description,
    required this.background,
    required this.backgroundContainer,
    required this.iconPath,
  });

  final String title;
  final String discount;
  final String description;
  final Color background;
  final Color backgroundContainer;
  final String iconPath;
}

class HomeServiceItem {
  const HomeServiceItem({required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;
}

class HomeServiceOfferItem {
  const HomeServiceOfferItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.reviewsCount,
    required this.ratingStars,
    this.buttonLabel = 'Add',
  });

  final String imageUrl;
  final String title;
  final String price;
  final String oldPrice;
  final int reviewsCount;
  final List<bool> ratingStars;
  final String buttonLabel;
}
