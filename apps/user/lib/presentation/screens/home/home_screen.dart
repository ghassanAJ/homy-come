import 'package:design_system/design_system.dart';
import 'package:user/data/model/home_content.dart';
import 'package:user/domain/repository/home_repository.dart';
import 'package:user/di/di_container.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:user/presentation/widgets/home/category_item.dart';
import 'package:user/presentation/widgets/home/home_header.dart';
import 'package:user/presentation/widgets/home/offer_card.dart';
import 'package:user/presentation/widgets/home/section_header.dart';
import 'package:user/presentation/widgets/home/service_card.dart';
import 'package:user/presentation/widgets/home/service_offer_tile.dart';
import 'package:user/presentation/widgets/home/story_offer_card.dart';
import 'package:util/util.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<UserTranslation>();
    final homeContent = diContainer.get<HomeRepository>().getHomeContent();

    return Scaffold(
      backgroundColor: UIColor.background,
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            SizedBox(height: UI.spacing.xs),
            Divider(height: 1, thickness: 1, color: UIColor.neutral100),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: UI.padding.userHomeContent(
                        bottomInset:
                            UI.sizes.bottomNavigationBarHeight + UI.spacing.lg,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(title: tr.home.offersNews),
                          SizedBox(height: UI.spacing.sm),
                          SizedBox(
                            height: 138,
                            child: _offersList(homeContent.offers),
                          ),
                          SizedBox(height: UI.spacing.xl),
                          SectionTitle(title: tr.home.category),
                          SizedBox(height: UI.spacing.md),
                          _categoriesRow(homeContent.categories),
                          SizedBox(height: UI.spacing.xxl2),
                          SectionTitle(title: tr.home.storiesOffers),
                          SizedBox(height: UI.spacing.sm),
                          SizedBox(
                            height: 145,
                            child: _storyCards(homeContent.stories),
                          ),
                          SizedBox(height: UI.spacing.lg),
                          SectionHeaderWithAction(
                            title: tr.home.generalCleaning,
                            actionLabel: tr.home.seeAll,
                            onActionTap: () {
                              // TODO: Navigate to General Cleaning listing screen.
                            },
                          ),
                          SizedBox(height: UI.spacing.sm),
                          SizedBox(
                            height: 160,
                            child: _serviceCards(homeContent.generalServices),
                          ),
                          SizedBox(height: UI.spacing.xl),
                          SectionHeaderWithAction(
                            title: tr.home.plumberServices,
                            actionLabel: tr.home.seeAll,
                            onActionTap: () {
                              // TODO: Navigate to Plumber Services listing screen.
                            },
                          ),
                          SizedBox(height: UI.spacing.sm),
                          SizedBox(
                            height: 160,
                            child: _serviceCards(homeContent.plumberServices),
                          ),
                          SizedBox(height: UI.spacing.xl),
                          SectionHeaderWithAction(
                            title: tr.home.otherServices,
                            actionLabel: tr.home.seeAll,
                            onActionTap: () {
                              // TODO: Navigate to Other Services listing screen.
                            },
                          ),
                          SizedBox(height: UI.spacing.lg),
                          SizedBox(
                            height: 278,
                            child: _serviceOfferTiles(homeContent.serviceOffers),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _offersList(List<HomeOfferItem> items) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemEnd,
          child: OfferCard(
            image: item.image,
            package: item.package,
            aspectRatio: item.aspectRatio,
          ),
        );
      },
    );
  }

  Widget _categoriesRow(List<HomeCategoryItem> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final item in items)
            Padding(
              padding: UI.padding.userHomeItemEndWithXxs,
              child: CategoryItem(
                title: item.title,
                description: item.description,
                iconPath: item.iconPath,
              ),
            ),
        ],
      ),
    );
  }

  Widget _storyCards(List<HomeStoryItem> items) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemEndWithXxs,
          child: StoryOfferCard(
            title: item.title,
            discount: item.discount,
            description: item.description,
            background: item.background,
            backgroundContainer: item.backgroundContainer,
            iconPath: item.iconPath,
          ),
        );
      },
    );
  }

  Widget _serviceCards(List<HomeServiceItem> items) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemEndWithXxs,
          child: ServiceCard(title: item.title, imageUrl: item.imageUrl),
        );
      },
    );
  }

  Widget _serviceOfferTiles(List<HomeServiceOfferItem> items) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemEndWithXxs,
          child: ServiceOfferTile(
            imageUrl: item.imageUrl,
            title: item.title,
            price: item.price,
            oldPrice: item.oldPrice,
            reviewsCount: item.reviewsCount,
            ratingStars: item.ratingStars,
          ),
        );
      },
    );
  }
}
