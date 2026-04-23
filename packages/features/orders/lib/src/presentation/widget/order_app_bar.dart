import 'package:design_system/design_system.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class OrderAppBar extends StatelessWidget {
  const OrderAppBar({super.key, required this.scrollController});
  final TabController scrollController;
  @override
  Widget build(BuildContext context) {
    return UISliverAppBar(
      automaticallyImplyLeading: false,
      // toolbarHeight: 10,
      floating: true,
      snap: false,
      pinned: true,

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: UIFilterTabBar(
          tabs: [
            FilterTabContent(text: 'In Progress', iconPath: ''),
            FilterTabContent(text: 'Scheduled', iconPath: ''),
            FilterTabContent(text: 'Completed', iconPath: ''),
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
