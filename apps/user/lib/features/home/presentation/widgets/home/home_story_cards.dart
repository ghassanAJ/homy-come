import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/presentation/screens/stories_screen.dart';
import 'package:user/features/home/presentation/widgets/home/story_offer_card.dart';
import 'package:user/navigation/route.dart';

class HomeStoryCards extends StatelessWidget {
  const HomeStoryCards({required this.items, super.key});

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
            onTap: () {
              context.push(
                UserPaths.storiesScreen,
                extra: {
                  'pageIndex': index,
                  'storyItems':
                      items
                          .map(
                            (item) => StoryPageData(
                              stories:
                                  items
                                      .map(
                                        (item) => UINetworkImage(
                                          imageUrl: item.imageUrl ?? '',
                                        ),
                                      )
                                      .toList(),
                            ),
                          )
                          .toList(),
                },
              );
            },
            child: StoryOfferCard(
              title: item.imageUrl ?? '',
              discount: item.serviceId ?? '',
              description: item.serviceId ?? '',
              background: UIColor.background,
              backgroundContainer: UIColor.background,
              iconPath: Assets.icons.navCategory,
            ),
          ),
        );
      },
    );
  }
}
