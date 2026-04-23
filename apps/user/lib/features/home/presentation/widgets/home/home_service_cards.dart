import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/widgets/home/service_card.dart';
import 'package:user/navigation/route.dart';

class HomeServiceCards extends StatelessWidget {
  const HomeServiceCards({required this.servicePreviews, super.key});

  final List<ServicePreviewResponseModel> servicePreviews;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 8),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: servicePreviews.length,
      itemBuilder: (context, index) {
        final item = servicePreviews[index];
        return Padding(
          padding:
              index == 0
                  ? EdgeInsetsDirectional.only(start: 24)
                  : EdgeInsets.zero,
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
