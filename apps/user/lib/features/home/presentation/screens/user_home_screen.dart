import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/widgets/home/home_content_lists.dart';
import 'package:user/features/home/presentation/widgets/home/home_header.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';
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

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<UserTranslation>();
    final homeContent = diContainer.get<HomeRepository>().getHomeContent();
    final bottomInset = UI.sizes.bottomNavigationBarHeight + UI.spacing.lg;

    return Scaffold(
      backgroundColor: UIColor.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return NestedScrollView(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxScrolled) {
              return [
                UserHomeAppBar(
                  constraints: constraints,
                  scrollController: controller,
                ),
              ];
            },
            body: UIEllipseBackground(
              child: SafeArea(
                child: Column(
                  children: [
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
                                    onActionTap:
                                        () => context.go(UserPaths.services),
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
        },
      ),
    );
  }
}

class UserHomeAppBar extends StatelessWidget {
  const UserHomeAppBar({
    super.key,
    required this.constraints,
    required this.scrollController,
  });

  final BoxConstraints constraints;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final currentUser = diContainer.get<AppCubit>().state.user;
    final tabBarHeight = _getTabBarHeight(context);

    return SliverAppBar(
      backgroundColor: UIColor.white,
      elevation: 0,
      clipBehavior: Clip.none,
      floating: false,
      snap: false,
      pinned: true,
      expandedHeight: UI.sizes.appBarHeight, // AppBar height + tab bar height
      // title: AnimatedBuilder(
      //   animation: scrollController,
      //   builder: (context, child) {
      //     // Calculate collapse ratio (0 = expanded, 1 = collapsed)
      //     final scrollOffset =
      //         scrollController.hasClients ? scrollController.offset : 0.0;
      //     final collapseRatio = (scrollOffset / tabBarHeight).clamp(0.0, 1.0);

      //     return _buildAnimatedCollapsedTitle(
      //       context,
      //       currentUser,
      //       collapseRatio,
      //     );
      //   },
      // ),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // const SizedBox(height: 56), // AppBar height
              HomeHeader(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsetsDirectional.only(start: 32),
              //       child: Align(
              //         alignment: Alignment.centerLeft,
              //         child: UIText.h3(
              //           "Hi ${currentUser?.firstName ?? ''}",
              //           color: UIColor.primaryDark,
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsetsDirectional.only(end: 16),
              //       child: IconButton(
              //         padding: EdgeInsets.zero,
              //         icon: UISvg(Assets.icons.notification),
              //         onPressed: () {},
              //       ),
              //     ),
              //     //  const SizedBox(width: 12),
              //   ],
              // ),
              // Expanded(child: ChildrenTabBar()),
            ],
          ),
        ),
      ),
    );
  }

  // ✨ Animated wrapper for collapsed title
  Widget _buildAnimatedCollapsedTitle(
    BuildContext context,
    UserModel? currentUser,
    double collapseRatio,
  ) {
    // Start fading in at 0.7, fully visible at 0.95
    final opacity =
        collapseRatio < 0.7
            ? 0.0
            : ((collapseRatio - 0.7) / 0.25).clamp(0.0, 1.0);

    // Slide from top: -20px to 0px
    final slideOffset = (1.0 - opacity) * -20.0;

    return IgnorePointer(
      ignoring: opacity < 0.5, // Disable interaction when barely visible
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(0, slideOffset),
          child: _buildCollapsedTitle(context, currentUser),
        ),
      ),
    );
  }

  Widget _buildCollapsedTitle(BuildContext context, UserModel? currentUser) {
    return Builder(
      builder: (context) {
        if (currentUser != null) {
          return Row(
            children: [
              const SizedBox(width: 12),
              ProfilePictureWidget(
                // childName: state.selectedChild?.firstName,
                // avatar: state.selectedChild?.profilePicture,
                // avatarColor: state.selectedChild?.avatarColor,
                // radius: 20,
                // fontSize: 20,
              ),

              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.caption(
                      "${currentUser.firstName} balance",
                      color: UIColor.neutral500,
                    ),
                    UIText.bodySmall(
                      '${(0.0).toStringAsFixed(0)} AED',
                      color: UIColor.primaryDark,
                      fontWeight: FontWeight.w700,
                      // fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfilePictureWidget(
                // childName: currentUser?.firstName,
                // avatar: currentUser?.profilePicture,
                // avatarColor: AvatarColor.primary,
                // radius: 20,
                // fontSize: 20,
              ),
              SizedBox(width: 6),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UIText.caption('current balance', color: UIColor.neutral500),
                  //   const SizedBox(height: 4),
                  UIText.bodySmall(
                    '${(0.0).toStringAsFixed(0)} AED',
                    color: UIColor.primaryDark,
                    fontWeight: FontWeight.w700,

                    // fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  double _getTabBarHeight(BuildContext context) {
    return constraints.maxWidth > 500
        ? MediaQuery.sizeOf(context).height * 0.35
        : MediaQuery.sizeOf(context).height * 0.08;
  }
}
