import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/features/home/presentation/widgets/home/categories_section.dart';
import 'package:user/features/home/presentation/widgets/home/home_divider.dart';
import 'package:user/features/home/presentation/widgets/home/home_services_section.dart';
import 'package:user/features/home/presentation/widgets/home/sliders_section.dart';
import 'package:user/features/home/presentation/widgets/home/stories_section.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      withBackgroundGradient: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<HomeBloc>().add(LoadHomeContentEvent());
            },
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              controller: controller,
              slivers: [
                HomeScreenAppBar(
                  appBarTitle: 'Home',
                  isCollapsed: isCollapsed,
                  expandedHeightappBar: expandedHeight,
                  collapsedHeightappBar: collapsedHeight,
                  onCollapsed: onCollapsed,
                  onTap: (index) {},
                ),

                const SlidersSection(),
                const HomeDivider(),
                const CategoriesSection(),
                const HomeDivider(),
                const StoriesSection(),
                const HomeDivider(),
                const HomeServicesSection(),

                SliverToBoxAdapter(child: SizedBox(height: _getBottomInset())),
              ],
            ),
          );
        },
      ),
    );
  }

  double _getBottomInset() {
    return UI.sizes.bottomNavigationBarHeight + UI.spacing.lg * 3;
  }

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(() => isCollapsed = value);
  }
}
