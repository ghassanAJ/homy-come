import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/presentation/widgets/home/offer_card.dart';
import 'package:user/navigation/route.dart';

class HomeOffersList extends StatelessWidget {
  const HomeOffersList({required this.items, super.key});

  final List<OfferModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemStartAndEnd(isFirst: index == 0),
          child: GestureDetector(
            onTap:
                () => context.push(
                  UserPaths.serviceDetails,
                  extra: {'id': item.serviceId},
                ),
            child: OfferCard(image: item.imageUrl ?? '', aspectRatio: 2 / 1),
          ),
        );
      },
    );
  }
}
