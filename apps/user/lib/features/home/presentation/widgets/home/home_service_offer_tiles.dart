import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/widgets/home/service_offer_tile.dart';

class HomeServiceOfferTiles extends StatelessWidget {
  const HomeServiceOfferTiles({required this.services, super.key});

  final List<ServicePreviewResponseModel> services;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: services.length,
      itemBuilder: (context, index) {
        final item = services[index];
        return Padding(
          padding: UI.padding.userHomeItemStartAndEnd(isFirst: index == 0),
          child: ServiceOfferTile(servicePreviewResponseModel: item),
        );
      },
    );
  }
}
