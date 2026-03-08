
import 'package:design_system/design_system.dart';
import 'package:orders/src/presentation/widget/shimmer_order_card.dart';

class OrdersShimmerLoadingWidget extends StatelessWidget {
  const OrdersShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.md,
        vertical: UI.spacing.md,
      ),
      itemCount: 3,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: UI.spacing.md),
          child: const ShimmerOrderCard(),
        );
      },
    );
  }
}
