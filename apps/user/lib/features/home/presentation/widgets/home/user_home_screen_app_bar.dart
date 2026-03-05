import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/home/presentation/widgets/home/home_header.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:user/navigation/route.dart';
import 'package:util/util.dart';

class HomeScreenAppBar extends SliverAppBar {
  final bool isCollapsed;
  final double expandedHeightappBar;
  final double collapsedHeightappBar;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;
  final String appBarTitle;

  const HomeScreenAppBar({
    super.key,
    required this.isCollapsed,
    required this.expandedHeightappBar,
    required this.collapsedHeightappBar,
    required this.onCollapsed,
    required this.onTap,
    required this.appBarTitle,
  }) : super(elevation: 4.0, pinned: true, forceElevated: true);

  @override
  double get toolbarHeight => collapsedHeightappBar;

  @override
  Widget? get title {
    final user = diContainer.get<AppCubit>().state.user;
    return AnimatedOpacity(
      opacity: !isCollapsed ? 1 : 0,
      duration: const Duration(milliseconds: 100),
      child: Column(
        children: [
          Row(
            children: [
              UISvg(Assets.icons.location, size: 16),
              SizedBox(width: UI.spacing.xxs),
              Flexible(
                child: UIText.bodySmall(
                  user?.address?.toString() ?? 'no address selected',
                  maxLines: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: UI.spacing.xs),
          CategoriesSearchField(
            controller: TextEditingController(),
            readOnly: true,
            onTap: () {
              diContainer.get<CustomRouter>().push(UserPaths.search);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return UIEllipseBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.constrainHeight();
          final collapsedHight =
              MediaQuery.of(context).viewPadding.top + kToolbarHeight + 50;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            onCollapsed(collapsedHight != top);
          });

          return FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: const HomeHeader(),
          );
        },
      ),
    );
  }

  @override
  double get expandedHeight => expandedHeightappBar;
  @override
  double get collapsedHeight => collapsedHeightappBar;
  @override
  Color? get backgroundColor => UIColor.white;

  @override
  Color? get surfaceTintColor => UIColor.white;

  @override
  bool? get centerTitle => false;
}
