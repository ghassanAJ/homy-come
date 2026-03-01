import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/widgets/home/home_content_lists.dart';
import 'package:user/features/home/presentation/widgets/home/home_header.dart';
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
                        padding: UI.padding.userHomeContent(
                          bottomInset:
                              UI.sizes.bottomNavigationBarHeight +
                              UI.spacing.lg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(title: tr.home.offersNews),
                            SizedBox(height: UI.spacing.sm),
                            SizedBox(
                              height: 138,
                              child: HomeOffersList(items: homeContent.offers),
                            ),
                            SizedBox(height: UI.spacing.xl),
                            SectionTitle(title: tr.home.category),
                            SizedBox(height: UI.spacing.md),
                            HomeCategoriesRow(items: homeContent.categories),
                            SizedBox(height: UI.spacing.xxl2),
                            SectionTitle(title: tr.home.storiesOffers),
                            SizedBox(height: UI.spacing.sm),
                            SizedBox(
                              height: 145,
                              child: HomeStoryCards(items: homeContent.stories),
                            ),
                            SizedBox(height: UI.spacing.lg),
                            SectionHeaderWithAction(
                              title: tr.home.generalCleaning,
                              actionLabel: tr.home.seeAll,
                              onActionTap: () {},
                            ),
                            SizedBox(height: UI.spacing.sm),
                            SizedBox(
                              height: 160,
                              child: HomeServiceCards(
                                items: homeContent.generalServices,
                              ),
                            ),
                            SizedBox(height: UI.spacing.xl),
                            SectionHeaderWithAction(
                              title: tr.home.plumberServices,
                              actionLabel: tr.home.seeAll,
                              onActionTap: () {},
                            ),
                            SizedBox(height: UI.spacing.sm),
                            SizedBox(
                              height: 160,
                              child: HomeServiceCards(
                                items: homeContent.plumberServices,
                              ),
                            ),
                            SizedBox(height: UI.spacing.xl),
                            SectionHeaderWithAction(
                              title: tr.home.otherServices,
                              actionLabel: tr.home.seeAll,
                              onActionTap: () => context.go(UserPaths.services),
                            ),
                            SizedBox(height: UI.spacing.lg),
                            SizedBox(
                              height: 278,
                              child: HomeServiceOfferTiles(
                                items: homeContent.serviceOffers,
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
