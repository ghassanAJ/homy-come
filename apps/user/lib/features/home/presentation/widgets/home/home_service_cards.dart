import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/widgets/home/service_card.dart';
import 'package:user/navigation/route.dart';

class HomeServiceCards extends StatelessWidget {
  const HomeServiceCards({required this.servicePreviews, super.key});

  final List<ServicePreviewResponseModel> servicePreviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: servicePreviews.length,
      itemBuilder: (context, index) {
        final item = servicePreviews[index];
        return Padding(
          padding: UI.padding.userHomeItemStartAndEnd(isFirst: index == 0),
          child: ServiceCard(
            onTap:
                () => context.push(
                  UserPaths.serviceDetails,
                  extra: {'id': item.documentId},
                ),
            title: item.info?.name ?? '',
            imageUrl: item.info?.image ?? '',
          ),
        );
      },
    );
  }
}
