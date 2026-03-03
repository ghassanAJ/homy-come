import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/mappers/home_response_mapper.dart';
import 'package:user/features/home/presentation/widgets/home/home_categories_row.dart';
import 'package:user/features/home/presentation/widgets/home/home_offers_list.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';
import 'package:user/features/home/presentation/widgets/home/home_service_cards.dart';
import 'package:user/features/home/presentation/widgets/home/home_service_offer_tiles.dart';
import 'package:user/features/home/presentation/widgets/home/home_story_cards.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:user/navigation/route.dart';
import 'package:util/util.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final ScrollController controller = ScrollController();

  bool isCollapsed = false;
  final double expandedHeight = 110;
  final double collapsedHeight = kToolbarHeight + 50;

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(() => isCollapsed = value);
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<UserTranslation>();
    final bottomInset = UI.sizes.bottomNavigationBarHeight + UI.spacing.lg * 3;
    final homeFuture = diContainer.get<HomeRepository>().getHomeContent();

    return UIScaffold(
      withBackgroundGradient: false,
      body: FutureBuilder(
        future: homeFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: UIColor.error),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
          final result = snapshot.data!;
          return result.fold(
            (homeResponse) {
              final homeContent = mapHomeResponseToContent(homeResponse);
              return LayoutBuilder(
                builder: (context, constraints) {
                  return CustomScrollView(
                    controller: controller,
                    slivers: [
                      HomeScreenAppBar(
                        key: ValueKey(isCollapsed),
                        appBarTitle: 'Home',
                        isCollapsed: isCollapsed,
                        expandedHeightappBar: expandedHeight,
                        collapsedHeightappBar: collapsedHeight,
                        onCollapsed: onCollapsed,
                        onTap: (index) {},
                      ),
                      // SliverToBoxAdapter(
                      //   child: Container(
                      //     margin: EdgeInsets.only(bottom: 20),

                      //     color: UIColor.border,
                      //     height: 10,
                      //     width: double.infinity,
                      //   ),
                      // ),
                      HomeSection(
                        title: tr.home.offersNews,
                        sectionBottomSpacing: UI.spacing.xl,
                        child: SizedBox(
                          height: 138,
                          child: HomeOffersList(items: homeContent.offers),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),

                          color: UIColor.border,
                          height: 10,
                          width: double.infinity,
                        ),
                      ),
                      HomeSection(
                        title: tr.home.category,
                        titleBottomSpacing: UI.spacing.md,
                        sectionBottomSpacing: UI.spacing.xxl2,
                        child: HomeCategoriesRow(items: homeContent.categories),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          color: UIColor.border,
                          height: 10,
                          width: double.infinity,
                        ),
                      ),
                      HomeSection(
                        title: tr.home.storiesOffers,
                        sectionBottomSpacing: UI.spacing.lg,
                        child: SizedBox(
                          height: 145,
                          child: HomeStoryCards(items: homeContent.stories),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),

                          color: UIColor.border,
                          height: 10,
                          width: double.infinity,
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
                        onActionTap: () => context.push(UserPaths.services),
                        titleBottomSpacing: UI.spacing.lg,
                        child: SizedBox(
                          height: 278,
                          child: HomeServiceOfferTiles(
                            items: homeContent.serviceOffers,
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: bottomInset)),
                      // UIEllipseBackground(
                      //   child: SafeArea(
                      //     child: Column(
                      //       children: [
                      //         SizedBox(height: UI.spacing.xs),
                      //         Divider(
                      //           height: 1,
                      //           thickness: 1,
                      //           color: UIColor.neutral100,
                      //         ),
                      //         Expanded(
                      //           child: SingleChildScrollView(
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Padding(
                      //                   padding: UI.padding.userHomeContentVertical(
                      //                     bottomInset: bottomInset,
                      //                   ),
                      //                   child: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       HomeSection(
                      //                         title: tr.home.offersNews,
                      //                         sectionBottomSpacing: UI.spacing.xl,
                      //                         child: SizedBox(
                      //                           height: 138,
                      //                           child: HomeOffersList(
                      //                             items: homeContent.offers,
                      //                           ),
                      //                         ),
                      //                       ),

                      //                       HomeSection(
                      //                         title: tr.home.category,
                      //                         titleBottomSpacing: UI.spacing.md,
                      //                         sectionBottomSpacing: UI.spacing.xxl2,
                      //                         child: HomeCategoriesRow(
                      //                           items: homeContent.categories,
                      //                         ),
                      //                       ),

                      //                       HomeSection(
                      //                         title: tr.home.storiesOffers,
                      //                         sectionBottomSpacing: UI.spacing.lg,
                      //                         child: SizedBox(
                      //                           height: 145,
                      //                           child: HomeStoryCards(
                      //                             items: homeContent.stories,
                      //                           ),
                      //                         ),
                      //                       ),

                      //                       HomeSection(
                      //                         title: tr.home.generalCleaning,
                      //                         actionLabel: tr.home.seeAll,
                      //                         onActionTap: () {},
                      //                         sectionBottomSpacing: UI.spacing.xl,
                      //                         child: SizedBox(
                      //                           height: 160,
                      //                           child: HomeServiceCards(
                      //                             items: homeContent.generalServices,
                      //                           ),
                      //                         ),
                      //                       ),

                      //                       HomeSection(
                      //                         title: tr.home.plumberServices,
                      //                         actionLabel: tr.home.seeAll,
                      //                         onActionTap: () {},
                      //                         sectionBottomSpacing: UI.spacing.xl,
                      //                         child: SizedBox(
                      //                           height: 160,
                      //                           child: HomeServiceCards(
                      //                             items: homeContent.plumberServices,
                      //                           ),
                      //                         ),
                      //                       ),

                      //                       HomeSection(
                      //                         title: tr.home.otherServices,
                      //                         actionLabel: tr.home.seeAll,
                      //                         onActionTap:
                      //                             () =>
                      //                                 context.go(UserPaths.services),
                      //                         titleBottomSpacing: UI.spacing.lg,
                      //                         child: SizedBox(
                      //                           height: 278,
                      //                           child: HomeServiceOfferTiles(
                      //                             items: homeContent.serviceOffers,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
              // ),
                    ],
                  );
                },
              );
            },
            (error) => Center(
              child: Text(
                error.message,
                style: TextStyle(color: UIColor.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
