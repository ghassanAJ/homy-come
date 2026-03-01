import 'package:design_system/design_system.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/presentation/widgets/home/service_offer_tile.dart';

class HomeServiceOfferTiles extends StatelessWidget {
  const HomeServiceOfferTiles({required this.items, super.key});

  final List<HomeServiceOfferItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemEndWithXxs,
          child: ServiceOfferTile(
            imageUrl: item.imageUrl,
            title: item.title,
            price: item.price,
            oldPrice: item.oldPrice,
            reviewsCount: item.reviewsCount,
            ratingStars: item.ratingStars,
          ),
        );
      },
    );
  }
}
