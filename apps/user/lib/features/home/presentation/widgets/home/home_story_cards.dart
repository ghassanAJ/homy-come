import 'package:design_system/design_system.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/presentation/widgets/home/story_offer_card.dart';

class HomeStoryCards extends StatelessWidget {
  const HomeStoryCards({required this.items, super.key});

  final List<HomeStoryItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemStartAndEnd(isFirst: index == 0),
          child: StoryOfferCard(
            title: item.title,
            discount: item.discount,
            description: item.description,
            background: item.background,
            backgroundContainer: item.backgroundContainer,
            iconPath: item.iconPath,
          ),
        );
      },
    );
  }
}
