import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/src/data/models/res/booking_model_response.dart';
import 'package:orders/src/presentation/widget/data_and_time_info_order_widget.dart';
import 'package:orders/src/presentation/widget/info_cleaner_of_order_widget.dart';
import 'package:orders/src/presentation/widget/location_of_myOrder_widget.dart';
import 'package:orders/src/presentation/widget/name_and_status_order_widget.dart';
import 'package:user/navigation/route.dart';

class ContentCardStatusOrder extends StatelessWidget {
  const ContentCardStatusOrder({super.key, required this.item});
  final BookingModelResponse item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderNameAndStatusWidget(name: item.serviceType, status: item.status),
        Divider(color: UIColor.bordarCard, height: 0.5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
          child: OrderCleanerInfoWidget(
            image: item.provider.image ?? '',
            name: item.provider.name,
            rating: item.provider.rating,
          ),
        ),
        Divider(color: UIColor.bordarCard, height: 0.5),
        OrderDateTimeWidget(date: item.date, time: item.time),
        Divider(color: UIColor.bordarCard, height: 0.5),
        CurrentOrderLocationView(
          location: item.address,
          item: item,
          onTap: () {
            context.push(UserPaths.serviceDetailsSummarywithid(id: item.id));
          },
        ),
      ],
    );
  }
}
