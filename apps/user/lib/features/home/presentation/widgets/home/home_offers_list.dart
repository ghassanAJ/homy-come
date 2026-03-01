import 'package:design_system/design_system.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/presentation/widgets/home/offer_card.dart';

class HomeOffersList extends StatelessWidget {
  const HomeOffersList({required this.items, super.key});

  final List<HomeOfferItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemEnd,
          child: OfferCard(
            image: item.image,
            package: item.package,
            aspectRatio: item.aspectRatio,
          ),
        );
      },
    );
  }
}
