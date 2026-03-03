

import 'package:design_system/design_system.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class OrderAppBar extends StatelessWidget {
  const OrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return UISliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Padding(
          padding: EdgeInsets.only(left: UI.spacing.xl, top: UI.spacing.md),
          child: Column(children: [Divider(height: 4, color: UIColor.divider)]),
        ),
      ),
      variant: UISliverAppBarVariant.transparent,
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: BackButtonAppBar(),
        ),
      ),
      centerTitle: true,
      titleWidget: UIText.h4(context.orderTr.title.myOrder),

    );
  }
}
