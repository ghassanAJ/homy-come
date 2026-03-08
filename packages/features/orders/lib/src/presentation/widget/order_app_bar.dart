import 'package:design_system/design_system.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class OrderAppBar extends StatelessWidget {
  const OrderAppBar({super.key, required this.scrollController});
  final TabController scrollController;
  @override
  Widget build(BuildContext context) {
    return UISliverAppBar(
      // toolbarHeight: 10,
      floating: true,
      snap: false,
      pinned: true,

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: UIFilterTabBar(
          tabs: [
            FilterTabContent(text: 'in progress', iconPath: ''),
            FilterTabContent(text: 'scheduled', iconPath: ''),
            FilterTabContent(text: 'completed', iconPath: ''),
          ],
          package: 'my order',
          tabController: scrollController,
        ),
      ),
      variant: UISliverAppBarVariant.transparent,

      centerTitle: true,
      titleWidget: UIText.h4(context.orderTr.title.myOrder),
    );
  }
}
