import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/widgets/home/home_content_lists.dart';
import 'package:user/features/home/presentation/widgets/home/home_header.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';
import 'package:user/features/home/presentation/widgets/home/section_header.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:user/navigation/route.dart';
import 'package:util/util.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<UserTranslation>();
    final homeContent = diContainer.get<HomeRepository>().getHomeContent();
    final bottomInset = UI.sizes.bottomNavigationBarHeight + UI.spacing.lg;

    return Scaffold(
      backgroundColor: UIColor.background,
      body: UIEllipseBackground(
        child: SafeArea(
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
                        padding: UI.padding.userHomeContentVertical(
                          bottomInset: bottomInset,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeSection(
                              title: tr.home.offersNews,
                              sectionBottomSpacing: UI.spacing.xl,
                              child: SizedBox(
                                height: 138,
                                child: HomeOffersList(
                                  items: homeContent.offers,
                                ),
                              ),
                            ),

                            HomeSection(
                              title: tr.home.category,
                              titleBottomSpacing: UI.spacing.md,
                              sectionBottomSpacing: UI.spacing.xxl2,
                              child: HomeCategoriesRow(
                                items: homeContent.categories,
                              ),
                            ),

                            HomeSection(
                              title: tr.home.storiesOffers,
                              sectionBottomSpacing: UI.spacing.lg,
                              child: SizedBox(
                                height: 145,
                                child: HomeStoryCards(
                                  items: homeContent.stories,
                                ),
                              ),
                            ),

                            HomeSection(
                              title: tr.home.generalCleaning,
                              actionLabel: tr.home.seeAll,
                              onActionTap: () {},
                              sectionBottomSpacing: UI.spacing.xl,
                              child: SizedBox(
                                height: 160,
                                child: HomeServiceCards(
                                  items: homeContent.generalServices,
                                ),
                              ),
                            ),

                            HomeSection(
                              title: tr.home.plumberServices,
                              actionLabel: tr.home.seeAll,
                              onActionTap: () {},
                              sectionBottomSpacing: UI.spacing.xl,
                              child: SizedBox(
                                height: 160,
                                child: HomeServiceCards(
                                  items: homeContent.plumberServices,
                                ),
                              ),
                            ),

                            HomeSection(
                              title: tr.home.otherServices,
                              actionLabel: tr.home.seeAll,
                              onActionTap: () => context.go(UserPaths.services),
                              titleBottomSpacing: UI.spacing.lg,
                              child: SizedBox(
                                height: 278,
                                child: HomeServiceOfferTiles(
                                  items: homeContent.serviceOffers,
                                ),
                              ),
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
      ),
    );
  }
}
