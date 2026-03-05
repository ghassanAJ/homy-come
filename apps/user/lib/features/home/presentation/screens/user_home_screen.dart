import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/home_categories_row.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';
import 'package:user/features/home/presentation/widgets/home/home_service_cards.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
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

    return UIScaffold(
      withBackgroundGradient: false,
      body: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (context, state) {
          if (state.status == HomeBlocStatus.loadingCategories) {
            if (state.error != null) {
              return Center(
                child: Text(
                  state.error?.message ?? '',
                  style: TextStyle(color: UIColor.error),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          final categories = state.categories;
          final offers = state.offers;
          final sliders = state.sliders;

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
                    child: HomeCategoriesRow(items: state.categories),
                  ),
                  // HomeSection(
                  //   title: tr.home.storiesOffers,
                  //   sectionBottomSpacing: UI.spacing.lg,
                  //   child: SizedBox(
                  //     height: 145,
                  //     child: HomeStoryCards(items: state.stories),
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),

                      color: UIColor.border,
                      height: 10,
                      width: double.infinity,
                    ),
                  ),
                  ...List.generate(
                    categories.length,
                    (index) =>
                        state.categories[index].servicePreviews.isNotEmpty
                            ? HomeSection(
                              title: categories[index].name,
                              sectionBottomSpacing: UI.spacing.xl,
                              child: SizedBox(
                                height: 158,
                                child: HomeServiceCards(
                                  servicePreviews:
                                      state.categories[index].servicePreviews,
                                ),
                              ),
                            )
                            : const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
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

                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     margin: EdgeInsets.only(bottom: 20),
                  //     color: UIColor.border,
                  //     height: 10,
                  //     width: double.infinity,
                  //   ),
                  // ),

                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     margin: EdgeInsets.only(bottom: 20),

                  //     color: UIColor.border,
                  //     height: 10,
                  //     width: double.infinity,
                  //   ),
                  // ),
                  // HomeSection(
                  //   title: tr.home.generalCleaning,
                  //   actionLabel: tr.home.seeAll,
                  //   onActionTap: () {},
                  //   sectionBottomSpacing: UI.spacing.xl,
                  //   child: SizedBox(
                  //     height: 160,
                  //     child: HomeServiceCards(
                  //       items: homeContent.generalServices,
                  //     ),
                  //   ),
                  // ),

                  // HomeSection(
                  //   title: tr.home.plumberServices,
                  //   actionLabel: tr.home.seeAll,
                  //   onActionTap: () {},
                  //   sectionBottomSpacing: UI.spacing.xl,
                  //   child: SizedBox(
                  //     height: 160,
                  //     child: HomeServiceCards(
                  //       items: homeContent.plumberServices,
                  //     ),
                  //   ),
                  // ),

                  // HomeSection(
                  //   title: tr.home.otherServices,
                  //   actionLabel: tr.home.seeAll,
                  //   onActionTap: () => context.push(UserPaths.services),
                  //   titleBottomSpacing: UI.spacing.lg,
                  //   child: SizedBox(
                  //     height: 278,
                  //     child: HomeServiceOfferTiles(
                  //       items: homeContent.serviceOffers,
                  //     ),
                  //   ),
                  // ),
                  SliverToBoxAdapter(child: SizedBox(height: bottomInset)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
